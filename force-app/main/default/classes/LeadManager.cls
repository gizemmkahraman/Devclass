@RestResource(urlMapping='/Lead/*')
global with sharing class LeadManager {
    //https://ddn000005kxn4mag-dev-ed.develop.my.salesforce.com/services/apexrest/Lead/00QDn0000031CVHMA2
    @HttpGet 
    global static Lead getLead(){
        RestRequest request = RestContext.request;
        String endpoint =request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id leadId = endpoint.substring(lastIndex+1);
        Lead ld = [SELECT Id, LastName, Phone, Status, Company FROM Lead WHERE Id = :LeadId];
        return ld;
}
@HttpPost 
global static Id postLead(String firstName,String lastName, String company, String phone){
 Lead ld = new Lead();
 ld.FirstName = firstName;
 ld.LastName = lastName;
 ld.Company = company;
 ld.Phone = phone;
 insert ld;
 return ld.Id;
}
@HttpDelete
global static string deleteLead(){
    RestRequest request = RestContext.request;
        String endpoint =request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id leadId = endpoint.substring(lastIndex+1);
    try {
        Lead ld = [SELECT Id FROM Lead WHERE Id = :LeadId];
        delete ld;
    } catch (Exception e) {
        return 'Fail';
    }
    return 'Success';
}@HttpPut 
global static Lead putLead(){
 RestRequest request =  RestContext.request;
 String body = request.requestBody.toString();
 Lead ld = (Lead)JSON.deserialize(body, Lead.class);
 upsert ld;
 return ld;
}
@HttpPatch
    global static Lead patchLead() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Lead ld = (Lead)JSON.deserialize(body, Lead.class);
        update ld;
        Lead updatedld =[SELECT Id, Name, Phone, Status, Company FROM Lead WHERE Id = :ld.Id];
        return updatedld;
    }
}