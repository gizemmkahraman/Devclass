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
        system.debug('record is updated ac ==> ' + ac);
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
    public static void dmlDemoInsert_cstmObj2() {
     Salesforce_Project__c sp = [select id from Salesforce_Project__c order by createddate desc limit 1];
     //create ticket instance
        Salesforce_Ticket__c newST = new Salesforce_Ticket__c();
        newST.Subject__c = 'create related record via apex';
        newST.Priority__c = 'High';
        newST.Status__c = 'New';
        newST.Requested_by_date__c = date.today();
         //set relationship id
        newST.Salesforce_Project__c = sp.Id;
        //insert it now
        insert newST;
    }
    public static void dmlMultipleRecordInsert_right1(){
        List<Account> listAccount = new List<Account>();
        account acc1 = new account();
        acc1.Name = 'Bulk acc1';
        acc1.ShippingCity = 'New york';
        acc1.Active__c = 'No';
        listAccount.add(acc1);

        account acc2 = new account();
        acc2.Name = 'Bulk acc2';
        acc2.ShippingCity = 'DC';
        acc2.Active__c = 'Yes';
        listAccount.add(acc2);

        account acc3 = new account();
        acc3.Name = 'Bulk acc3';
        acc3.ShippingCity = 'DC';
        acc3.Active__c = 'Yes';
        listAccount.add(acc3);
        //after add to list ,insert the list.
        insert listAccount;
    }
    public static void dmlMultipleRecordInsert_right2(){
       List<Account> insertAccountList = new List<Account>();
       for (integer i = 0; i<166; i++) {
        account a= new account();
        a.Name ='Softinnovas v' +i;
        a.Phone = '987654321' +i;
        a.AccountNumber = 'rt' +i;
        a.Active__c = 'Yes';
         insertAccountList.add(a);
        }
         //check if list is not empty
         //.isEmpty() -> true when empty, false when NOT empty
        //!isEmpty() -> false when empty, true when NOT empty
        if (!insertAccountList.isEmpty()) {
         insert insertAccountList;
        }
    }
    //get the latest created 50 accounts and update name.
    //append B.0 to account name.
    public static  void dmlDemoMultipleUpdate_right1(){
     List<account> listAcccount = [select id, name from account order by createddate desc limit 50];
     for (account eachAcc : listAcccount) {
        eachAcc.Name += ' B.0 ';
     }        
     update listAcccount;
    }
    //we query all accounts - 213
      //update name and append 'Yy' if active Yes.
      //update name and append 'Nn' if active is null.
    public static void dmlDemoMultipleUpdate_right2(){
        List<account> listAccount = [select id, name, Active__c from account ]; //213
        list<account> updateAccountList = new list<account>();

        for(account eachAcc : listAccount){
            if(eachAcc.Active__c == 'Yes'){
                eachAcc.Name = eachAcc.Name + ' Yy';
                updateAccountList.add(eachAcc);
            }else if(eachAcc.Active__c == null){
                eachAcc.Name = eachAcc.Name + ' Nn';
                updateAccountList.add(eachAcc);
            }
        }
        if(!updateAccountList.isEmpty()){
            update updateAccountList;
        }
    }
    }
        
     
        
       
