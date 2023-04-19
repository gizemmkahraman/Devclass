@isTest
public class SOQLDemoAgainTest {
   @TestSetup
   static void makeData(){
    //3 account records here.
    Account acc = new account();
    acc.Name = 'test 1';
    acc.Industry = 'Energy';

    Account acc2 = new account();
    acc2.Name = 'test 2';
    acc2.Industry = 'Energy';

    Account acc3 = new account();
    acc3.Name = 'test 3';
    acc3.Industry = 'Banking';
    list<account> listAcc = new list<account>{acc, acc2, acc3};
    insert listAcc;
   }
    @isTest
   private static void testchildToParent_SOQL1() {
    //how we get those accounts here?
    //soql
    list<account> allAccs =[SELECT Id FROM Account];
    //300 contacts. 100 contacts for each account.
    List<contact> listCon = new list<contact>();
    for (Integer i = 0; i < 300; i++) {

        contact c = new contact();
        c.LastName = 'anything ' + i;

        if (i < 100) {
            c.accountId = allAccs[0].id;
        } else if(i < 200){
            c.AccountId = allAccs[1].id;
        } else {
            c.AccountId = allAccs[2].id;
        }
        listCon.add(c);
    }
    insert listCon;

    //start test
    Test.startTest();
    SoqlDemoAgain.childToParent_SOQL1();
    Test.stopTest();
    //call method
    //stop test

    //no assertion required because our method is NOT doing anything.
   }
   @isTest
   private static void testParentToChild1() {
        //3 account records
        List<account> allAccs = [select id, type from account];
        for (account eachAcc : allAccs) {
            eachAcc.type = 'Customer - direct';
        }
        update allAccs;

        //300 opps.
        List<Opportunity> listOpps = new List<Opportunity>();
        for (Integer i = 0; i < 300; i++) {
            Opportunity o = new Opportunity();
            o.StageName = 'New';
            o.Name = 'test opp';
            o.CloseDate = date.today();
            if (i < 100) {
                o.accountId = allAccs[0].id;
            } else if(i < 200){
                o.AccountId = allAccs[1].id;
            } else {
                o.AccountId = allAccs[2].id;
            }
            listOpps.add(o);
        }
        insert listOpps;

        SoqlDemoAgain.parentToChild_SOQL1();
   }
}