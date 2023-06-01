public with sharing class AccountController {
   @AuraEnabled(cacheable=true)
   public static List<Account> getAccountsByIndustry(String industry){
    return [SELECT Id, Name, Type, Industry, AnnualRevenue
            FROM Account 
            WHERE Industry= :industry
            WITH SECURITY_ENFORCED];
   }
}