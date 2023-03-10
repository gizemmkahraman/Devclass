public class AccountSchedule implements Schedulable{
    public void execute (SchedulableContext sc) {
        //start a batch
        AccountsBatch ab = new AccountsBatch();
        Database.executeBatch(ab, 50);
    }
}