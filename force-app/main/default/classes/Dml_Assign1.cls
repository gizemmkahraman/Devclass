public class Dml_Assign1 {
     public void insertRecords() {
            List<Account> accounts = new List<Account>();
            for (Integer i = 0; i < 20; i++) {
                Account acc = new Account();
                acc.Name = 'Test Account Created ' + i;
                accounts.add(acc);
            }
                insert accounts;
               
        }
    
     public void updateRecords() {
            List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name LIKE 'Test Account Created%'];
            for (Account eachAcc : accounts) {
                eachAcc.Name = eachAcc.Name + ' Updated';
            }
            update accounts;
        }
    }