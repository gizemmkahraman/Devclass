//JSON Format
//key always string
//always " "
{
    "Name" : "ABC Pvt Ltd",
    "Type" : "Consulting",
    "Industry" : "Education",
    "AnnualRevenue" : 2000000,
    "Established" : 2000
}

//Get an account record, convert that into json format.
Account acc =[SELECT Name, Type, Industry, AnnualRevenue FROM Account WHERE Type != null AND Industry != null AND AnnualRevenue != null LIMIT 1];
String jsonString = JSON.serialize(acc);
system.debug(jsonString);

//get 5 account record, convert them to json format.
List<Account> accounts =[SELECT Id, Name, Type, Industry, AnnualRevenue FROM Account WHERE Type != null AND Industry != null AND AnnualRevenue != null LIMIT 5];
String jsonString = JSON.serialize(accounts);
system.debug(jsonString);

//get an opp record, convert to json format
//name type stage amount
Opportunity opp =[SELECT Name, Type, StageName, Amount FROM Opportunity WHERE Type != null AND StageName != null AND Amount != null LIMIT 1];
String jsonString = JSON.serialize(opp);
system.debug(jsonString);

//get top 10 opp based on amount,convert them inti json format
list<Opportunity> opps = [SELECT Id, Name, Type, StageName, Amount FROM Opportunity WHERE Type != null AND StageName != null AND Amount != null ORDER BY Amount DESC LIMIT 10];
String jsonString = JSON.serialize(opps);
system.debug(jsonString);



//1. You need Employee__c custom object -DONE
//2. You need EmployerWrapper
//3. Remote sote setting
//4. Callout method




//test rest callouts
RestCallouts.getAnimals();

RestCallouts.getAirlines();



RestCallouts.getEmployees();
RestCallouts.getCaseInfo();
RestCallouts.postAnimal();


//SOAP CALLOUTS
SoapCallouts.getParksByCountry('United States');
SoapCallouts.doAddCallout(77,23);
SoapCallouts.doMultiplyCallout(12, 10);