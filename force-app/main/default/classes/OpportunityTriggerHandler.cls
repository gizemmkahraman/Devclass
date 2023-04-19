public with sharing class OpportunityTriggerHandler {
  
    public static void updateOwner(set<id> oppIds){
        //get record using set of id
        list<Opportunity> listOpp =[SELECT Id, OwnerId, New_Owner__c, Name FROM Opportunity WHERE Id IN :oppIds];
        List<opportunity> updateOpp = new List<opportunity>();

        map<id,string> mapUserIdTitle =new map<id,string>();
        for (opportunity eachOpp :  listOpp) {
            if(eachOpp.New_Owner__c !=null){
                mapUserIdTitle.put(eachOpp.New_Owner__c, eachOpp.name + ' Manager');
                eachOpp.OwnerId =eachOpp.New_Owner__c;
                eachOpp.New_Owner__c =null;
                updateOpp.add(eachOpp);
            }
        }
            if(!updateOpp.isEmpty()){
            update updateOpp;
        }

        //set owner as new owner
        //set new owner as blank
        //update
        updateUserDetails(mapUserIdTitle);
        
    }
   

  @future 
public static void updateUserDetails(map<id, string> mapUserDetail){
    Profile standardUserProfile = [SELECT Id FROM Profile WHERE Name ='Standard User'];
    list<user> allUser=[SELECT Id, Title, ProfileId FROM User WHERE Id IN: mapUserDetail.keySet()];
    for (user eachUser : allUser) {
        eachUser.profileId = standardUserProfile.Id;
        eachUser.Title = mapUserDetail.get(eachUser.Id);
    }
    update allUser;
}
}