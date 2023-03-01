public class updateSalesforceTickets {
    @invocableMethod
    public static void updateSTStatus(List<id> projectIds) {
        list<Salesforce_Ticket__c> stList = new list<Salesforce_Ticket__c>();
        list<Salesforce_Ticket__c> sTickectList = [SELECT Id, Name, Salesforce_Project__c, Status__c FROM Salesforce_Ticket__c  WHERE Salesforce_Project__c =:projectIds AND Status__c != 'Completed' ];
            for (Salesforce_Ticket__c eachSt : sTickectList) {
                eachSt.Status__c = 'Completed';
                stList.add(eachSt);
            }
            if (!stList.isEmpty()) {
                update stList;
            }
    }
}