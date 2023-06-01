public with sharing class LeadController {
   @AuraEnabled
   public static list<Lead> getRecentLeads(){
    return [SELECT Id, FirstName, LastName, Title, Company, Email, Industry 
            FROM Lead
            WITH SECURITY_ENFORCED 
            ORDER BY CreatedDate DESC
            LIMIT 5 ];
}
}