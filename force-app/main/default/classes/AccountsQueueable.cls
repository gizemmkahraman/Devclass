public class AccountsQueueable implements Queueable {
    list<Account> listAccount = new list<Account>();

    // this is a parameterless constructor.
    public AccountsQueueable(list<Account> accs) {
        listAccount = accs;
    }
    public void execute(QueueableContext qc){
        system.debug('inside execiute method listAccount ==> ' +listAccount);
        //update name of all acoounts in lisAccount.
        for (account eachAcc : listAccount) {
            eachAcc.Name += '----SI';
        }
        update listAccount;
    }
}