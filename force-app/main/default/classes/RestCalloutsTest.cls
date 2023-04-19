@isTest
public with sharing class RestCalloutsTest {
    @isTest
    private static void getAnimalsTest(){
        Test.startTest();
        //1.set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2.makecallout
        HttpResponse response = RestCallouts.getAnimals();

        //3.perform assertions
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }

    @isTest
    private static void getAirlinesTest(){
        Test.startTest();
        //1.set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2.make callout
        HttpResponse response = RestCallouts.getAirlines();

        //3.perform assertion
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }
    @isTest
    private static void postAirlinesTest(){
        Test.startTest();
        //1.set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2.make callout
        Airlines__c airlines = new Airlines__c();
        airlines.Name = '125432';
        airlines.Name__c = 'Turkish Airlines';
        airlines.Country__c = 'Turkiye';
        airlines.Established__c = '2023';
        airlines.Slogan__c = 'Ne mutlu Turkum diyene';
        airlines.LogoURL__c = 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.turkishairlines.com%2Fen-int%2[…]e=images&cd=vfe&ved=0CBAQjRxqFwoTCJjP4-zsqv4CFQAAAAAdAAAAABAE';
        insert airlines;

        //3.perform assertion
        System.assert(airlines.Id != null);
        Test.stopTest();
  
}
@isTest
    private static void getEmployeesTest(){
        Test.startTest();
        //1.set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2.make callout
        HttpResponse response = RestCallouts.getEmployees();

        //3.perform assertion
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }
    @isTest

    private static void getCaseInfo() {
        Test.startTest();
        //1.set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2.make callout
        HttpResponse response = RestCallouts.getCaseInfo();
        //3.perform assertion
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }
    @isTest

    private static void postAnimalTest() {
        Test.startTest();
        //1.set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2.make callout
        HttpResponse response = RestCallouts.postAnimal();
        //3.perform assertion
        System.assertEquals(201, response.getStatusCode());
        System.assertEquals('Created', response.getStatus());
        Test.stopTest();
    }
    private static void postEmployeeTest() {
        Test.startTest();
        //1.set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2.make callout
       
       Employee__c employee = new Employee__c();
       employee.Username__c='123546';
       employee.Name__c = 'gizem';
        employee.Email__c = 'g@gmail.com';
       employee.Gender__c ='Female';
       employee.Designation__c ='USA';
       employee.Phone_Number__c = '35467548657';
       employee.Complete_Address__c ='Sf';
       insert employee;

        //3.perform assertion
        System.assert(employee.Id != null);
        Test.stopTest();
    }
    }