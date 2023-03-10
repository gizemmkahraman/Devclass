public class AccountTriggerHandler {
    public static void updateDescription(list<account> accTriggerNew, list<account> accTriggerOld, map<id,account> accTriggerNewMap, map<id,account> accTriggerOldMap) {
        for(Account eachAccount : acctriggerNew){
            Boolean updateDesc =false;
            if(trigger.isInsert && eachAccount.active__c == 'Yes'){
                //update description field
                //how to update description?
                 //set the value
                 updateDesc = true;
                 //eachAccount.Description = 'Account is active now.Enjoy!';
            }
            if(trigger.isUpdate){
                //check if active field is changed no or none  to yes.
                //how to check if active field is changed?
                 //old and new value is not same.

                 //new active field.
                 string newActive = eachAccount.Active__c;
                 //old active field.
                 Account oldAccount = accTriggerOldMap.get(eachAccount.Id);
                 string oldActive = oldAccount.Active__c;
                 if(newActive != oldActive && newActive == 'Yes'){
                    updateDesc = true;
                    //eachAccount.Description = 'Account is active now.Enjoy!Enjoy!';
                 }
            }
        if(updateDesc){
            eachAccount.Description = 'Account is active now.enjoy!Enjoy!Enjoy!';
        }
        }
    }
    public static void updateVIPforAllContacts(list<account> accTriggerNew, list<account> accTriggerOld, map<id,account> accTriggerNewMap, map<id,account> accTriggerOldMap) {
       //set of account ids where VIP is changed.
        set<id> accIds = new set<id>();
        for (account eachAccount  : accTriggerNew) {
            //how tocheck if vip is changed?
            //old vip != new map
            if(eachAccount.VIP__C != accTriggerOldMap.get(eachAccount.Id).VIP__c){
                accIds.add(eachAccount.Id);
            }
        }
        if(!accIds.isEmpty()){
            //GET CONTACTS FOR ALL ACCOUNTS WHERE VIP IS CHANGED.
            list<contact> listContacts = [SELECT Id, VIP__c, AccountId FROM Contact WHERE AccountId IN :accIds];
                for (contact eachContact : listContacts){
                    //update VIP FIELD of eachContact same as its account's vip field.
                    //first we get here account's vip field value.
                    account newAcc = accTriggerNewMap.get(eachContact.AccountId);
                    Boolean accVIP = newAcc.vip__c;

                    eachContact.vip__c = accVIP;
                }
                if(!listContacts.isEmpty()){
                    update listContacts;
                }
            }
        }
    

       /*public static void updateBillingCityforAllContacts(list<account> accTriggerNew, list<account> accTriggerOld, map<id,account> accTriggerNewMap, map<id,account> accTriggerOldMap) {
         set<id> accId = new set<id>();
         for (account acc : trigger.new) {
            if(acc.billingcity != accTriggerOldMap.get(acc.Id).billingcity){
                accId.add(acc.Id);
         }
         list<contact> listCon = [SELECT Id, AccountId, Mailingcity FROM Contact WHERE AccountId IN :accId];
         for (contact con : listCon) {
            con.mailingcity =accTriggerNewMap.get(con.AccountId).billingcity;          
         }
         if(!listCon.isEmpty()){
            
         }
        }
    }*/
   /* public static void tryCatchContact(list<account> triggerNew){
        try {
            List<Contact> conList = new List<Contact>();
            for (Account acc : triggerNew) {
            contact con = new contact();
            con.LastName = 'Star';
            con.AccountId = acc.Id;
            conList.add(con);
            }
            if (!conList.isEmpty()) {
                insert conList;
            }
    }   catch (Exception ex) {
        for (Account acc : triggerNew) {
            acc.addError('Error! Missing status field on contact.');
        }
    }
    } */
}
