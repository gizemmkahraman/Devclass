public class Datetime_Assignment {
    public void diffofDate(){
    date varTomorrowDate = date.newInstance(2023, 1, 17);
    system.debug('Tomorrow day is ' + varTomorrowDate);

    date  varTodaysDate = date.newInstance(2023, 1, 16);
    system.debug('Tomday day is ' + varTodaysDate);

    integer betweendays = varTodaysDate.daysBetween(varTomorrowDate);
    system.debug('The difference of ' + varTomorrowDate + ' and ' + varTodaysDate + ' is ' + betweendays);
    }
public void timeCheck(){
datetime varTomorrowDatetime = datetime.newInstance(2023, 1, 17, 7, 0, 0);
datetime var10DaysDatetime = datetime.newInstanceGMT(2023, 1, 27, 9, 0, 0);

long varDatetimeLong = 12339874361L;
datetime varTomorrow7 = varTomorrowDatetime.addDays(7);
datetime var10Days10 = var10DaysDatetime.addDays(10);
system.debug('7 days after today is ' + varTomorrow7);
system.debug('10 days after January 27 is ' + var10Days10);

}

}