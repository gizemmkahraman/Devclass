trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
   //get trigger switch record for salesforce project.
     TriggerSwitch__mdt ts = TriggerSwitch__mdt.getInstance('salesforce_project_c');
   if(!ts.enabled__c){
    return;
   }
   /*import account anad contact records 100 000
 => account trigger and contact trigger are running.
 => we DONT want our triggers to run while importing.

 Trigger Switch
 -custom settiings
   -we CANNOT move data to another org. We have to re-create data.
   -we CAN write DML to create data.
 -custom metadata
   - we CAN move data also
   - we CANNOT write DML */
   
   
    if (Trigger.isafter && trigger.isinsert) {
    
        system.debug('call method now...');
        SPTriggerHandler.updateProjectDescription(trigger.newMap.keySet());
        //update the same project here
        system.debug('method JUST called...');
        //call handler method here.
        SPTriggerHandler.createDefaultTicket(Trigger.new);
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('before update project trigger called');
        //validate status complete method
        //SPTriggerHandler.validateStatusCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    if(Trigger.isAfter && Trigger.isUpdate){
       SPTriggerHandler.projectStatusChange(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

}