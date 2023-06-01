@isTest
public with sharing class StudentCtrlTest {
   @TestSetup
   static void makeData(){
    List<Student__c> stList = new List<Student__c>();
    for(Integer i=1; i<=10; i++){
        Student__c st = new Student__c();
        st.Student_Name__c = 'Test Name' + i ;
        st.Postal_Code__c = '94015';
        st.Country__c = 'Turkey';
        st.City__c = 'Yalova';
        stList.add(st);
    }
    insert stList;
}

@isTest
private static void testSearchStudentsByPostalCode(){
    Test.startTest();
    List<Student__c> result =StudentCtrl.searchStudentsByPostalCode('94');
    Test.stopTest();
    Assert.areEqual(10,result.size());


}
    

   }