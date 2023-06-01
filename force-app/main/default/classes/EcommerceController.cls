public with sharing class EcommerceController {
   @AuraEnabled
   public static List<EcommerceProduct__c> getProductsByPrice(Integer amount){
    return[ SELECT Id, Title__c, Brand__c, Category__c, Price__c 
            FROM EcommerceProduct__c  
            WHERE Price__c <= :amount 
            WITH SECURITY_ENFORCED];
    
   }
}