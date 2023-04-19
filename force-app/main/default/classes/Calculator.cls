public class Calculator {

public void publicMessage(){

    system.debug('public method called.');
    //call private method from public method
    system.debug('calling private method.');
    privateMessage1();
    system.debug('called private method.');
}

private void privateMessage1(){

    system.debug('private method called.');
    
}



public void welcomeMessage() {
    system.debug('welcome to apex calc');
    }

public void printNewMessage(string msg){
      system.debug(msg);
// default acces modifier -->private
   // void printNewMessage(string msg){
     // system.debug(msg);


    }

//return type string
//parameter type =string (only 1)
public string printAndReturnMessage(string m){
 string returnStr ='';
 system.debug('message is ' + m);
 returnStr = m + '....OK Cool';
 return returnStr;
}


 public integer add(integer a,integer b){
  integer sum = a + b;
  return sum;
  }

 public integer add(integer x,integer y, integer z){
  integer sum = x+y+z;
  return sum;
  }

//return true if date dalls in leap year
//return false if date is not in leap year
 public boolean leapYearCheck(date dt){
  integer year =dt.year(); //returns year component
  //year = 2023
  Boolean lp = date.isLeapYear(year);
  //lp =  false
  return lp;

 }
}