public class String_Assignment {
    public void printString(){
string localString = 'Thanks for the session on the string';
    system.debug(localString);

integer lengthOfStr = localString.length();
    system.debug('length of this string is...' + lengthOfStr);

string strCapital = localString.toUpperCase();
    system.debug('capital string is ==> ' + strCapital);

Boolean containsSession = localString.contains('session');
    system.debug('Is string contains session???' + containsSession);

Boolean containsSessions = localString.contains('sessions');
    system.debug('Is string contains sessions???' + containsSessions);

Boolean containsSession1 = localString.containsIgnoreCase('SESSION');
    system.debug('Is string contains SESSION???' + containsSession1);    
    }
}