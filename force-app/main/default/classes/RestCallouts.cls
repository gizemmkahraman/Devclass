public with sharing class RestCallouts {


   //End point: https://th-apex-http-callout.herokuapp.com/animals
   //http method:get
   public static HttpResponse getAnimals(){
        //1.prepare httpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');

        //2.Prepare internet
        Http http = new Http();

        //3.Send the request over the internet to receive httpResponse 
        HttpResponse response = http.send(request);

        //4.Process the response
        System.debug(response.getStatus());
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
        return response;
   }
   //End point : https://api.instantwebtools.net/v1/airlines/1
   //http method: GET

   public static HttpResponse getAirlines(){
      //1. Prepare HttpRequest and wrap all the necessary data in it.
      HttpRequest request = new HttpRequest();
      request.setEndPoint('https://api.instantwebtools.net/v1/airlines/1');
      request.setMethod('GET');

      //2.Prepare internet.
      Http http = new Http();

      //3.Send the request over the internet in order to receive Response.
      HttpResponse response = http.send(request);

      //4.Process the response.
      if(response.getStatusCode() == 200){
         String jsonString = response.getBody();

         //Convert json string into wrapper.
         AirlinesWrapper wrapper = (AirlinesWrapper)JSON.deserialize(jsonString, AirlinesWrapper.class);

         //Convert wrapper into sObject record.
         Airlines__c airline = new Airlines__c();
         airline.Name = String.valueOf(wrapper.id);
         airline.Name__c = wrapper.name;
         airline.Country__c = wrapper.country;
         airline.LogoURL__c = wrapper.logo;
         airline.Slogan__c = wrapper.slogan;
         airline.Head_Quaters__c = wrapper.head_quaters;
         airline.Website__c = wrapper.website;
         airline.Established__c = wrapper.established;

         //Create airlines record.
         try{
            insert airline;
         } catch(Exception ex){
            system.debug(ex.getMessage());
         }
   
     
        
      } else {
         System.debug(response.getStatus());
         System.debug(response.getStatusCode());
         System.debug(response.getBody());
      }
      return response;
   }

   //Endpoint : https://api.onlinewebtutorblog.com/employees
   //Http method : GET

   public static HttpResponse getEmployees(){
       //1. Prepare HttpRequest and wrap all the necessary data in it.
      HttpRequest request = new HttpRequest();
      request.setEndPoint('https://api.onlinewebtutorblog.com/employees');
      request.setMethod('GET');
      //2.Prepare internet.
      Http http = new Http();
      //3.Send the request over the internet in order to receive Response.
      HttpResponse response = http.send(request);
      //4.Process the response.
      if(response.getStatusCode() == 200){
         String jsonString = response.getBody();

         //Convert json string into wrapper.
         EmployeeWrapper empWrapper = (EmployeeWrapper)JSON.deserialize(jsonString, EmployeeWrapper.class);
         List<EmployeeWrapper.Employee> employees = empWrapper.data;

          //Convert wrapper into sObject record.
          List<Employee__c> emps = new List<Employee__c>();
          for (EmployeeWrapper.Employee empWrap : employees) {

            Employee__c emp = new Employee__c();
            emp.Name = String.valueOf(empWrap.id);
            emp.Username__c = empWrap.username;
            emp.Name__c = empWrap.name;
            emp.Email__c = empWrap.email;
            emp.Gender__c = empWrap.gender;
            emp.Designation__c = empWrap.designation;
            emp.Phone_Number__c = empWrap.phone_number;
            emp.Complete_Address__c = empWrap.complete_address;
            emps.add(emp);
          }
          //insert employee records.
          try{
            insert emps;
          }catch(Exception ex){
            system.debug(ex.getMessage());
          }
      } else{
         system.debug(response.getStatus());
         system.debug(response.getStatusCode());
   }
         return response;
}

   //Endpoint://https://ddn000005kxqema4-dev-ed.develop.my.salesforce.com//services/apexrest/Case/500Dn000003zdsjIAA
   //HTTP Method:'GET'
    public static HttpResponse getCaseInfo(){
       //1.prepare httpRequest and wrap all the necessary data in it.
       HttpRequest request = new HttpRequest();
       request.setEndpoint('callout:NC_PRACTISEORG/services/apexrest/Case/500Dn000003zdsjIAA');
       request.setMethod('GET');

       //2.Prepare internet
         Http http = new Http();

       //3.Send the request over the internet in order to receive Response.
       HttpResponse response =http.send(request);

       //4.Process the response.
       System.debug(response.getStatus());
       System.debug(response.getStatusCode());
       System.debug(response.getBody());
       return response;
    }

    //End point: https://th-apex-http-callout.herokuapp.com/animals
   //http method:POST

   public static HttpResponse postAnimal(){
      //1.prepare httpRequest and wrap all the necessary data in it.
      HttpRequest request = new HttpRequest();
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');

        //set JSON body
        request.setBody('{"name":"might moose"}');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

       //2.Prepare internet
       Http http = new Http();

       //3.Send the request over the internet in order to receive Response.
       HttpResponse response = http.send(request);

       //4.Process the response.
       System.debug(response.getStatus());//ok created.
       System.debug(response.getStatusCode());//201,200
       System.debug(response.getBody());
       return response;
   }
   //Endpoint: https://api.instantwebtools.net/v1/airlines     
    //Http Method: POST
    @future(callout=true)
   public static void postAirlines(Id airlineId){
      //1.prepare httpRequest and wrap all the necessary data in it.
      HttpRequest request = new HttpRequest();
        request.setEndPoint('https://api.instantwebtools.net/v1/airlines');
        request.setMethod('POST');
      //set JSON body
      Airlines__c airline = [SELECT Name, Name__c, Country__c, LogoURL__c, Slogan__c, Head_Quaters__c, Website__c, Established__c 
                             FROM Airlines__c
                             WHERE Id = :airlineId];

       AirlinesWrapper wrapper = new AirlinesWrapper();
       wrapper.country=airline.Country__c;
       wrapper.established = airline.Established__c;
       wrapper.head_quaters = airline.Head_Quaters__c;
       wrapper.logo = airline.LogoURL__c;
       wrapper.name = airline.Name__c;
       wrapper.slogan = airline.Slogan__c;
       wrapper.website = airline.Website__c; 
       String body = JSON.serialize(wrapper);// deserialize -->from json
       request.setBody(body);
       request.setHeader('Content-Type', 'application/json;charset=UTF-8');  

       //2.Prepare internet
       Http http = new Http();

      //3.Send the request over the internet in order to receive Response.
      HttpResponse response = http.send(request);

       //4.Process the response.
       if(response.getStatusCode() == 200 || response.getStatusCode() ==201){
         system.debug('Data has been sent successfully!');
       }else{
         system.debug(response.getBody());
       }
      
}
    @future(callout=true)
   public static void postEmployee(Id employeeId){
      //1.prepare httpRequest and wrap all the necessary data in it.
      HttpRequest request = new HttpRequest();
      request.setEndPoint('https://api.onlinewebtutorblog.com/employees');
      request.setMethod('POST');
      //set JSON body
      Employee__c employee = [SELECT Name, Name__c, Gender__c, Phone_Number__c, Username__c, Email__c, Designation__c, Complete_Address__c
                             FROM Employee__c
                             WHERE Id = :employeeId];
    EmployeeWrapper.Employee wrapper = new EmployeeWrapper.Employee();
    wrapper.username = employee.Username__c;
    wrapper.name = employee.Name__c;
    wrapper.email = employee.Email__c;
    wrapper.gender= employee.Gender__c;
    wrapper.designation = employee.Designation__c;
    wrapper.phone_number = employee.Phone_Number__c;
    wrapper.complete_address=employee.Complete_Address__c;
    String body = JSON.serialize(wrapper);// deserialize -->from json
    request.setBody(body);
    request.setHeader('Content-Type', 'application/json;charset=UTF-8');  
    //2.Prepare internet
    Http http = new Http();

    //3.Send the request over the internet in order to receive Response.
    HttpResponse response = http.send(request);

    //4.Process the response.
    if(response.getStatusCode() == 200 || response.getStatusCode() ==201){
      system.debug('Data has been sent successfully!');
    }else{
      system.debug(response.getBody());
    }
}
}