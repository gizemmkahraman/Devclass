public class ValidateAddress {
    public void validateHomeAddress(){
     string houseName = 'New Home';
     string streetName = 'Turks';
     string cityName = 'San Francisco';
     string stateName = 'California';
     string stateIso = 'CA';
     string countryName = 'United States';
     string countryIso = 'USA';
     //The number of characters in the street name
     integer streetlength =streetName.length();
     system.debug('Street Name lenght is ' + streetlength);

     //Check if the street name contains a house name in it or not.
    Boolean streetnm = streetName.contains(houseName);
    system.debug('Is street name contains house name ? ==> ' + streetnm);

    //Find if the street name contains the state iso code in it
    Boolean streetIso = streetName.contains(stateIso);
    system.debug('Is street name contains state iso? ==> ' + streetIso);

    //Convert the state iso code, country iso code, country name to uppercase and city name, and state name to lowercase.
    string stateIsoCode = stateIso.toUpperCase();
    system.debug('State Iso Code Uppercase ==> ' + stateIsoCode);
    string countryIsoCode = countryIso.toUpperCase();
    system.debug('Country Iso Code Uppercase ==> ' + countryIsoCode);
    string countrynm = countryName.toUpperCase();
     system.debug('Country Name Uppercase ==> ' + countrynm);

     string citynm = cityName.toLowerCase();
     system.debug('City Name Lowercase ==> ' + citynm);
     string staten = stateName.toLowerCase();
     system.debug('State Name Lowercase ==> ' +staten);

    //Concatenate the house name, street name, City Name, State Name, and Country Name and store it in a variable
    string mix = 'My house name is ' + houseName + 'street name is ' + streetName + ' state name is ' + stateName + 'country name is ' + countryName;
    system.debug('Here is the full address ==> ' + mix);

    }
}