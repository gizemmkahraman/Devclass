trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {
 if(trigger.isAfter && trigger.isInsert){
   // map<id, opportunity> oppNewMap = trigger.newMap;
 OpportunityTriggerHandler.updateOwner(trigger.newMap.keySet());
}
}