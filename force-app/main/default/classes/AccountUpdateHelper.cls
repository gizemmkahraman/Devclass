public class AccountUpdateHelper {
    @invocableMethod
    public static void updateAccountWebsite(list<Id> accIds) {
        list<account> listAccount =[SELECT Id, Website FROM Account WHERE Id IN :accIds];
        for(Account eachAccount : listAccount){
            eachAccount.Website ='www.softinnovas.com';
        }
        update listAccount;
    }
}