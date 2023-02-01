List<string> listcity = new List<string>{'İstanbul', 'Madrid', 'Amsterdam', 'New York', 'Paris', 'Toronto'};
system.debug(listcity);

system.debug('liste uzunlugu = ' + listcity.size());
system.debug('listeenin ilk elemani = ' + listcity.get(0) + ' listenin son elemani = ' +listcity.get(5));

Boolean contain = listcity.contains('İstanbul');
system.debug('Liste istanbul iceriyor mu? ' + contain);
Boolean contain2 = listcity.contains('Roma');
system.debug('Liste roma iceriyor mu? ' + contain2);

for(string cities: listcity){
string add = cities +'City ';
system.debug(add);
}
Set<string> setCity = new Set<string>(listcity);
system.debug(setCity);
setCity.remove('Paris');
system.debug(setCity);
setCity.add('Antalya');
setCity.add('Londra');
system.debug(setCity);

system.debug('Toplam liste = ' + setCity + ' eleman sayisi = ' +setCity.size());

setCity.clear();
system.debug(setCity);

Boolean empty = setCity.isEmpty();
system.debug('set bos mu? = ' + empty);
