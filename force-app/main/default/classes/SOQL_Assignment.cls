public class SOQL_Assignment {
    public static void soql_WhereClause(){
        List<contact>  lstcontact = [Select id, name,lastname from Contact where lastname like '%A%'];
        system.debug('List size ==> ' + lstcontact.size());
    }
    public static void soql_formethod(){
        List<contact>  lstcontact = [Select Id, LastName, Phone from Contact ];

        for(contact listcon : lstcontact){
            System.debug('lastname ==>' + listcon.LastName);
            System.debug('phone number ==>' + listcon.Phone);
        }
    }
}