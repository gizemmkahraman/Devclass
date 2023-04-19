@isTest
public with sharing class SoapCalloutsTest {
    @isTest
    private static void getParksByCountryTest(){
        Test.startTest();
        //1.set the mock
        ParkServicesMOck mock = new ParkServicesMOck();
        Test.setMock(WebServiceMock.class, mock);
        //2.perform callout
        String[] parks= SoapCallouts.getParksByCountry('United States');
        //3. Do assertions
        System.assertEquals(2, parks.size());
        Test.stopTest();
    }
}