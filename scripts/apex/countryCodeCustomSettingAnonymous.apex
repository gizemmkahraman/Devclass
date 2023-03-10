Map<string, country_code__c> countryCodes = country_code__c.getall();
system.debug('country code map ' + countryCodes);

//print=> country is unuted states, its code USA.
for(string eachName : countryCodes.keyset()){
    country_code__c eachRecord = countryCodes.get(eachName);
    system.debug('country is  ' + eachName +' ,  its code is ' + eachRecord.code__c);

}

//if we wnt to get just one value directly
country_code__c ccIndia = country_code__c.getInstance('India');
system.debug(ccIndia);
system.debug('ccIndia code ' + ccIndia.code__c);