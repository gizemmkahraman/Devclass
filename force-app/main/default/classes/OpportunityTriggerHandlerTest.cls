@isTest
public with sharing class OpportunityTriggerHandlerTest {
    @TestSetup
    static void makeData(){
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r =[SELECT Id FROM UserRole WHERE Name='CEO'];

        String orgId = UserInfo.getOrganizationId();  
        String dateString =   
        String.valueof(Datetime.now()).replace( ' ','').replace(':',' ' ).replace('-',' ');  
        Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));  
        String uniqueName = orgId + dateString + randomInt;

        User usr = new user();
        usr.FirstName ='Vitamin';
        usr.LastName = 'B12';
        usr.Email = 'gizemm@gmail.com';
        usr.ProfileId = p.Id;
        usr.UserRoleId = r.Id;
        usr.UserName='vitaminb12-@gmail.com';
        usr.EmailEncodingKey = 'ISO-8859-1';
        usr.Alias = uniqueName.substring(18, 23); 
        usr.TimeZoneSidKey = 'America/Los_Angeles';
        usr.LocaleSidKey = 'en_US'; 
        usr.LanguageLocaleKey = 'en_US'; 
        insert usr;
    }
    @isTest
   private static void testUpdateOwner() {
    //prepare data
    //user
     user uNew=[SELECT Id FROM USER WHERE FirstName = 'Vitamin'];
    opportunity op= new opportunity();
    op.Name= 'Test oppp';
    op.StageName= 'Prospecting';
    op.CloseDate= date.today();
    op.New_Owner__c= uNew.Id;
    insert op;

    set<id> oppSetId = new set<id>{op.Id};
    test.startTest();
    OpportunityTriggerHandler.updateOwner(oppSetId);
    test.stopTest();

    //assert
    opportunity getOpp = [SELECT Id, New_Owner__c, OwnerId  FROM Opportunity LIMIT 1];
    system.assertEquals(uNew.Id, getOpp.OwnerId);
 //assert user title
 User u=[SELECT Id, Title FROM User Where Id=: uNew.Id];
 system.assertEquals('Test oppp Manager', u.Title, 'title update succesfullyyyy' );
    }
}