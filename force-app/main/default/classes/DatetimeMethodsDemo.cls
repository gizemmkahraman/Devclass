public class DatetimeMethodsDemo {
    public void calculateAgeInMonths(){

        date birthDate = date.newInstance(1996, 7, 7);

        date todayDate = date.today();
        //age in months using months between
        integer ageInMonths =birthDate.monthsBetween(todayDate);
        system.debug('Gizem age in month is ==> ' + ageInMonths);


        integer ageInDays = birthDate.daysBetween(todayDate);
        system.debug('Gizem age in days is ==> ' + ageInDays);  
     }

public void printSubscriptionEndDate(){
   Date subStartDate = date.today();

   Date subEndDate = subStartDate.addDays(1000);
   system.debug('subscription end date is  ==> ' + subEndDate);

   //year
   integer endDateYear = subEndDate.year();
   system.debug('year of end date ' + endDateYear);

   integer endDateMonth =subEndDate.month();
   system.debug('month of the end date ' + endDateMonth);

     }

public void printOfferEndDate(){

datetime offerStart = datetime.now();
datetime offerEnd = offerStart.addHours(51);

system.debug('offer end datetime is ' + offerEnd);

//JUST the DATE component of offerEnd
Date offerEndDATE = offerEnd.date();
system.debug('offer enddate is ' + offerEndDATE);

}


public void birthDateInMS(){
 datetime birthDT = datetime.newInstance(1996, 7, 7, 7, 00, 00);
 long birthDateMS = birthDt.getTime();
 system.debug('Gizem birth datetime in ms ==> ' + birthDateMS);



}

    }