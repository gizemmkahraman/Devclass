@isTest
public with sharing class LeadManagerTest {
    @TestSetup
    private static void makeData(){
        List<Lead> leads = new List<Lead>();
        for(Integer i=1; i<=2; i++){
            Lead ld =  new Lead(LastName='Lead Test '+i);
            ld.Status= 'Open - Not Contacted';
            ld.Company ='Softinnovas';
            leads.add(ld);
        }
        insert leads;
    }
    @isTest 
    private static void getLeadTest(){
        Test.startTest();
        //1.Prepare RestRequest and wrap all the necessarry information in it.
        Lead ld = [SELECT Id, LastName, Status, Company FROM Lead LIMIT 1];
        String endpoint = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Lead/' + ld.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'GET';

        //2.Prepare RestContext.
        RestContext.request = request;

        //3.Make callout.
        Lead ld1 = LeadManager.getLead();

        //4.Perform asserts.
        Assert.areEqual(ld.LastName, ld1.LastName);
        Test.stopTest();
    }
    @isTest 
    private  static void postLeadTest() {
        Test.startTest();
        //1.Make callout.
        Id ldId = LeadManager.postLead('Lead ', 'Test', 'Salesforce', '8739283728');
        //2.Perform asserts.
        Assert.isNotNull(ldId);
        Test.stopTest();
    }
    @isTest 
    private static void deleteLeadTest(){
        Test.startTest();
        //1.Prepare RestRequest and wrap all the necessarry information in it.
        Lead ld = [SELECT Id FROM Lead LIMIT 1 ];
        String endpoint = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Lead/' + ld.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'DELETE';

        //2.Prepare RestContext.
        RestContext.request = request;
        //3.Make callout.(Success case.)
        String status = LeadManager.deleteLead();
        //4.Perform asserts.
        assert.areEqual('Success', status);
        Test.stopTest();
    }
    @isTest 
    private static void deleteLeadFailTest(){
        Test.startTest();
        //1.Prepare RestRequest and wrap all the necessarry information in it.
        Lead ld = [SELECT Id FROM Lead LIMIT 1 ];
        String endpoint = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Lead/' + ld.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'DELETE';

        //2.Prepare RestContext.
        RestContext.request = request;
        //3.Make callout.(Failure case.)
        String statusOld = LeadManager.deleteLead();
        String status = LeadManager.deleteLead();
        //4.Perform asserts.
        assert.areEqual('Fail', status);
        Test.stopTest();
    }
    @isTest 
    private static void putLeadTest(){
        Test.startTest();
         //1.Prepare RestRequest and wrap all the necessarry information in it.
              //Step 1
            Lead ld = new Lead(FirstName='My lead', LastName='test', Company='ABC', Phone='89089070980');
            String body = JSON.serialize(ld);
              //Step 2
              RestRequest request = new RestRequest();
              request.requestBody = Blob.valueOf(body);
              request.httpMethod = 'PUT';

         //2.Prepare RestContext.
         RestContext.request = request;

         //3.Make callout.
         Lead newLd = LeadManager.putLead();

         //4.perform asserts.
         Assert.isNotNull(newLd.Id);
         Assert.areEqual(ld.LastName, newLd.LastName);
         Assert.areEqual(ld.Company, newLd.Company);
         Test.stopTest();
    }
    @isTest 
    private static void patchLeadTest(){
        Test.startTest();
    //1.Prepare RestRequest and wrap all the necessarry information in it.
      //Step 1
      Lead ld = [SELECT Id, LastName, Status, Company FROM Lead LIMIT 1];
      ld.Company = 'Loreal';
      ld.Status = 'Working - Contacted';
      String body =  JSON.serialize(ld);
      //Step 2
      RestRequest request = new RestRequest();
      request.requestBody = Blob.valueOf(body);
      request.httpMethod = 'PATCH';

    //2.Prepare RestContext.
    RestContext.request = request;

    //3.Make callout.
    Lead updatedLd = LeadManager.patchLead();

    //4.perform asserts.
    Assert.areEqual('Loreal', updatedLd.Company);
    Assert.areEqual('Working - Contacted', updatedLd.Status);
        Test.stopTest();
    }
}