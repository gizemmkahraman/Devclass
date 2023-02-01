public class PrimitiveDataTypeDemo2 {
    public void  printNewDate(){
      system.debug('create new dates here');
    

       Date newDate = date.newInstance(1995, 2, 17);
     system.debug('new date is ' + newDate);

      Date newDate2 = date.newInstance(2022, 1, 9);
       system.debug('new date2 is ' + newDate2);

      Date todayDate = date.today();
     system.debug('Today day is ' + todayDate);
     }

    public void printNewTime(){
     //newInstance hour,minute,seconds,milliseconds

     Time myTime = time.newInstance(8, 50, 15, 40);
      system.debug('my time is ' + myTime);

      Time myTime2 = time.newInstance(9, 80, 30, 20);
      system.debug('my time2 is ' + myTime2);
       }
 
  public void printNewDateTime(){
       Date newDate = date.today();
       Time newTime = time.newInstance(18, 50, 30,40);

       //1.NEW DATETIME USING DATE AND TIME

       Datetime  dt1 = Datetime.newInstance(newDate, newTime);
       system.debug('dt1 ' + dt1);


       //2.new datetime using YEAR,MONTh and day
    datetime dt2 = Datetime.newInstance(2020, 5 , 25);
    system.debug('dt2 is ' + dt2);
 
    
        //3. newinstance using YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
        Datetime dt3 = Datetime.newInstance(1999, 9, 14, 2, 50, 30);
        system.debug('dt3 ' + dt3);

        //4. newInstance from longtime
        long longtime = 0 ;
        datetime dt4 = datetime.newInstance(longtime);
        system.debug('dt4 ' + dt4);


        Long longTime2 = 192837465123L;
        Datetime dt4_1 = datetime.newInstance(longTime2);
        system.debug('dt4_1 => ' + dt4_1);

        //6.now
        datetime dt6 = datetime.now();
        system.debug('dt6 is ' + dt6);

        //5.newInstanceGMT
        Datetime dt5 = datetime.newInstanceGmt(1998, 5, 18, 15, 15, 15);
        system.debug('dt5 ' + dt5);
        


 }
 


}