public class AdditionNumbers {

    public  static integer first;
    public static integer second;

    public additionNumbers(integer a, integer b) {
     first = a;
     second =b;
    }
     
     public static void addNumbers(){
      integer sum = first + second;
        system.debug('sum ==> ' + sum);
     }
}