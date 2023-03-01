public class SPTriggerHandler {
    public static void createDefaultTicket(list<salesforce_project__c> spTriggerNew) {
     List<Salesforce_Ticket__c> newST= new List<salesforce_Ticket__c>();
        for (Salesforce_Project__c eachSP : spTriggerNew) {
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c ='Default ST';
            st.Salesforce_Project__c = eachSP.id; 
            newST.add(st);  
        }
        if(!newST.isEmpty()){
            insert newST;
        }
    }

    public static void validateStatusCompletion(list<salesforce_project__c> spTriggerNew, list<salesforce_project__c> spTriggerOld, map<id, salesforce_project__c> spTriggerNewMap, map<id,salesforce_project__c> spTriggerOldMap){
            Set<id> spIds = new Set<id>();
            //get all sp ids where status is changed to completed.
            for(Salesforce_project__c eachSp : spTriggerNew){
                    //check if status changed.
                    //and new status is completed.
                if(eachSp.status__c != spTriggerOldMap.get(eachSp.id).status__c && eachSp.status__c == 'Completed'){
                    spIds.add(eachSp.Id);
                }
            }
            if(!spIds.isEmpty()){
                //get the list of tickets which are not completed for spIds.
                list<Salesforce_Ticket__c> listST = [SELECT id, status__c, salesforce_project__c FROM Salesforce_Ticket__c WHERE salesforce_project__c IN :spIds AND status__c !='Completed'];

                  for(Salesforce_Ticket__c eachST : listST){
                    //throw error in project
                    Id projectId = eachST.salesforce_project__c;
                    //get new salesforce project.
                    salesforce_project__c newProject = spTriggerNewMap.get(projectId);
                    newProject.status__c.addError('Cannot complete project because all tickets are NOT completed.');
                
                  }
            
            }
    }

     public static void updateStatus(list<salesforce_project__c> TriggerNew, list<salesforce_project__c> TriggerOld, map<id, salesforce_project__c> TriggerNewMap, map<id, salesforce_project__c> TriggerOldMap){
     set<id> Ids =  new set<id>();
     list<Salesforce_Ticket__c> listSt =new list<Salesforce_Ticket__c>();
      for(Salesforce_Project__c sp :triggerNew){
        if (sp.Status__c != triggerOldMap.get(sp.id).Status__c && sp.Status__c == 'Completed') {
            Ids.add(sp.id);
        }
      }
      list<Salesforce_Ticket__c> listTicket =[SELECT Id, Salesforce_Project__c, Status__c  FROM  Salesforce_Ticket__c WHERE  Salesforce_Project__c  IN: Ids AND Status__c!='Completed'];
      for (Salesforce_Ticket__c eachSt : listTicket) {
        eachSt.Status__c = triggerNewMap.get(eachSt.Salesforce_Project__c).Status__c;
        listSt.add(eachSt);
      }
      if(!listSt.isEmpty()){
        update listSt;
      }
}


      //1.static
      //2.it must return void.
      //3.parameters: primitive datatypes or collection of primitive data types
      @future
      public static void updateProjectDescription(set<id> spIds){
        list<Salesforce_Project__c> listSP= [SELECT Id, Description__c FROM Salesforce_Project__c WHERE Id IN: spIds];
        for(Salesforce_Project__c eachSP: listSP){
          eachSP.Description__c = 'Updated from future.';
        }
        update listSp;
      }
}