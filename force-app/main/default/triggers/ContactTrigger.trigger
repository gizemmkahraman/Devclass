trigger ContactTrigger on Contact (before insert, after insert, before update, after update, after delete, after undelete) {

     if(trigger.isbefore && trigger.isUpdate){
        //call validation method of handler
        //ContactTriggerHandler.ContactUpdateValidation(trigger.new, trigger.old, trigger.newmap, trigger.oldmap);
        ContactTriggerHandler.ContactUpdateValidation2(trigger.new, trigger.old, trigger.newmap, trigger.oldmap);
     }
     if (trigger.isAfter) {
      //call method to update rollupsummary field.
      ContactTriggerHandler.rollupSummaryUpdate(trigger.new, trigger.old, trigger.newmap, trigger.oldmap);
     }
    }