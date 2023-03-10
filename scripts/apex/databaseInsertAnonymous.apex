List<account> listAccounts = new List<account>();   

Account a = new account();
a.Name = 'test accc';
listAccounts.add(a);

Account a1 = new account();
a1.Name = 'test acccddd';
listAccounts.add(a1);

Account a2 = new account();
listAccounts.add(a2);

Account a3 = new account();
listAccounts.add(a3);

Account a4 = new account();
a4.Name = 'test new';
listAccounts.add(a4);

Account a5 = new account();
listAccounts.add(a5);

//insert listAccounts; //how many accounts will be inserted with this dml? 0, it will throw error.

//param1: list of accounts to insert
//param2: true==> insert all records or NONE of them even if any one record has error
// Database.insert(listAccounts, true);

//param1: list of accounts to insert
//param2: false==> insert good records and it will not insert bad records.
List<DataBase.SaveResult> listResult = Database.insert(listAccounts, false);
//database.saveresult one record for each account.
  //we are inserting 4 account records, so listresult will have 4 records in it.
//.isSuccess => true if  succesfully inserted. else returns false.
for (DataBase.SaveResult eachResult : listResult) {
    if(eachResult.isSuccess()){
        system.debug('account record inserted succesfully,account record is ' + eachResult.getId() );  
    }else{
        system.debug('account insert FAILED.Error is ' + eachResult.getErrors());
    }
}

//USE database.insert(list,false) wherever possible.
