public class DmlDemo {
    public static void dmlDemoInsert_stndObj1(){
        //1.creating a new instance of account sObject.
        account acc = new account();
        //2.Set field vales. 
        acc.Name = 'SoftInnovas';
        //3.final step insert acc.
        insert acc;//This will create a anew record.
    }
    public static void dmlDemoInsert_cstmObj(){
        Salesforce_Project__c sp = new Salesforce_Project__c ();
        sp.Project_Name__c = 'Learn DML';
        sp.Description__c = 'Learn DML Batch14';
        sp.Status__c ='New';

        insert sp;
    }
    public static void dmlUpdateDemo_stndObj1(){
        Account ac = new account();
        ac.name = 'Salesforce';
        system.debug('before inserting ac ==> ' +ac);
        insert ac;
        system.debug('record is inserted ac ==> ' + ac);
        //we now have ID in account instance 'ac'.
        //we need ID if we want to update a record.
        ac.Name= 'Salesforce Inc.';
        //update
        update ac;
    }
    public static void dmlUpdateDemo_stndObj2(){
        //1.SOQL returns account bcz limit 1
        account acc =[select id, name from account where name like 'Softinnovas%' limit 1];
        //now set new field value
        acc.Name = 'Softinnovas Inc.';
        acc.Phone ='987654321';
        update acc;
        system.debug('acc==> ' + acc);
}   
    public static void dmlInsertDemo_stndObj2(){
        account acc =[select id, name from account where name like 'Softinnovas%' limit 1];
        //CREATE A INSTANCE
        contact c = new contact();
        c.LastName = 'Biden';
        //setting relationship
        c.AccountId = acc.Id;
        insert c;
}
}