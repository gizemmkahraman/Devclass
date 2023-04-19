public class ContactSendKycBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start(database.BatchableContext bc) {
        //soql query
        //[select id, firstName, LastName, send_for_kyc__c, send_for_kyc_date__c from Contact]
        Database.QueryLocator q = Database.getQueryLocator([select id, firstName, LastName, Sent_for_KYC__c, Send_for_KYV_Date__c from Contact]);
        return q;
    }
    public void execute(Database.BatchableContext bc, list<contact> scope){
        system.debug('inside execute method.');
        List<contact> updateContacts = new list<contact>();
        for(contact eachContact : scope){
            if(eachContact.Sent_for_KYC__c == false){
                eachContact.Sent_for_KYC__c = true;
                eachContact.Send_for_KYV_Date__c =date.today();
                updateContacts.add(eachContact);
            }

        }
        update updateContacts;
        system.debug('number of scope ' + scope.size());
    }
    public void finish(Database.BatchableContext bc){
        system.debug('finish method called.  Batch is done.');
    }
}