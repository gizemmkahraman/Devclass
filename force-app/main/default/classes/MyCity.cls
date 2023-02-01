public class MyCity {
public void cityInformation() {
    string state ='California';
    system.debug(state);

    string city = 'San Francisco';
    system.debug(city);

    string mix = 'Yaşadığım eyalet ===>' + state +' yaşadığım şehir ===> ' + city;
    system.debug(mix);

    Date foundDate = date.newInstance(1776, 7, 4);
    system.debug('USA kuruluş tarihi ' + foundDate);

    time sunrise = time.newInstance(7, 23, 0, 0);
    system.debug('San Francisco gün doğumu ' + sunrise);

    date today = date.today();
    date monthsbefore = today.addMonths(-36);
    system.debug('Bugünün tarihi ' + today + '36 ay öncesi ' + monthsbefore);
}
 public void stringMethod(){

    string description= 'I am a salesforce Developer';
    system.debug(description);

    Boolean containsForce = description.contains('force');
    system.debug('Is string contains force?' + containsForce);

    integer lengthOfStr = description.length();
    system.debug('length of this string is...' + lengthOfStr);

    string strCapital = description.toUpperCase();
    system.debug('capital string is ==> ' + strCapital);

    }
public void dataMethod(){


        Date newDate = date.today();
        system.debug('Today day is --> ' + newDate);
        
        datetime dt = datetime.now();
        system.debug('Date and Time --> ' + dt);

        DateTime newDateTime = dt.addHours(50);
        system.debug('After 50 hours --> ' + newDateTime);
}

    public string favoriteCafe;
    public string favoritePark;
    public string favoriteMall;
    public string favoriteStore;

    public string myFavoriteLocations(string city){
       system.debug('I live in San Francisco. My favorite cafe ' + ' ' +  favoriteCafe + ' ' + 'favorite park ' + ' ' + favoritePark + ' ' +  'favorite mall ' + ' ' + favoriteMall + ' ' + 'favorite store ' + ' ' +  favoriteStore);
        return city;
    }

    public void printString(integer num, string message){
     
      for(integer i=1; i <= num; i++){
      system.debug(message);
      }
    


    }
}