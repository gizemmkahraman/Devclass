public class Collections {
    public static List<string> LstMonth;
    public static string outputMonth;
    public static string  listAssignment(integer Input){
        LstMonth = new
        List<string>{'January','February','March','April','May','June','July','August','September','October','November','December'};
        system.debug('LstMonth ==> ' + LstMonth);
        if (Input > 0 &&   Input-1 < LstMonth.size()) {
            outputMonth = LstMonth[Input-1];
        }else {
            outputMonth ='Not a valid month.';
        }   
            system.debug('outpuMonth ==> ' + outputMonth); 
            return outputMonth;
    }
}