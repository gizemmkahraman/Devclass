public class Dml_Assign {
    public static void insert_dml(){ 
        account acc = new account();
        acc.Name = 'Gizem Assignment';
        insert acc;
        account acc1 = new account();
        acc1.Name = 'Nilgun Assignment';
        insert acc1;
    }
    public static void updating_dml(){
        Account ac = new account();
        ac.name = 'Account Created';
        insert ac;
        ac.Name= 'Account updated';
        update ac;
    }  
    }
