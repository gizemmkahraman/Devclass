@isTest
public class SPTriggerHandlerTest {
    @isTest
    public  static void  testFutureMethod1(){
        //1.prepare data.
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Learn dml';
        sp.Description__c = 'learn dml batch14';
        sp.Status__c = 'New';

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'Learn dml';
        sp2.Description__c = 'learn dml batch14';
        sp2.Status__c = 'New';
    
            list<Salesforce_Project__c> listSP= new list<Salesforce_Project__c>{sp, sp2};
            insert listSP;
            Set<Id> spIds = new Set<Id>{sp.id, sp2.id};

            //call future method.
            Test.startTest();
            SPTriggerHandler.updateProjectDescription(spIds);
            Test.stopTest();

            //assert.
            list<Salesforce_Project__c> allSP=[SELECT Id, Description__c FROM Salesforce_Project__c  WHERE Id IN :spIds];
            for(Salesforce_Project__c  s: allSP){
                assert.isTrue(s.Description__c.contains('future'));
            }
    }

    }
