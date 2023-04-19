public with sharing class AccountInvocable {
    @invocableMethod(label='Close Opportunities'
    description='This method is going to close all the open opprtunities when the account status is changed to inactive or hold'
    category='Account')
    public static void closeOpportunities(list<Id> accountsIds){
        List<Opportunity> opps =[SELECT Id, StageName FROM Opportunity WHERE AccountId IN: accountsIds AND StageName NOT IN (' Closed Lost', 'Closed Won') WITH SECURITY_ENFORCED];
        for (Opportunity opp : opps) {
            opp.StageName ='Closed Lost';
        }
        //save the updates
        try{
        update opps;
        }catch(Exception ex){
            //create a log 
            system.debug(ex.getMessage());
        }
    }
}