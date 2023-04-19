public with sharing class UpdateAccountTotalCaseCount {
    @invocableMethod
    public static void updateTotalCaseCount(list<ID> listAccountId) {
        list<AggregateResult> caseAGR =[SELECT count(id) casesCount, accountId FROM Case WHERE accountId IN:listAccountId];
        list<account> updateAccounts = new list<account>();
        for(AggregateResult agr: caseAGR){
            integer countOfCases = integer.valueOf(agr.get('casecCount'));
            account acc = new account();
            acc.Id= string.valueOf(agr.get('accountId'));
            acc.Total_Case_Count__c = countOfCases;
            updateAccounts.add(acc);
        }
        update updateAccounts;
    }
}