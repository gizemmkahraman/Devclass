public with sharing class StudentCtrl {
    @AuraEnabled
    public static List<Student__c> searchStudentsByPostalCode(string searchKey){
        searchKey = '%' + searchKey +'%';
        return [SELECT Student_Name__c,City__c, Class__c, Mobile__c, Email__c, Country__c, Postal_Code__c
                FROM Student__c
                WHERE Postal_Code__c like :searchKey
                WITH SECURITY_ENFORCED];
    }
}