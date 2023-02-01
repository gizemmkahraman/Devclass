list<string> listStr = new list<string>();
listStr.add('out of bond');
listStr.add('yes');
listStr.add('alright');
listStr.add('yes sir');

//|| out of bond || yes || alright
string concateStr = '';
//for each loop
//left:create (or define) a new variable to be used indside the for loop
//right: list variable name
for(string eachStr: listStr){
    concateStr +=' ||' + eachStr;
}
system.debug(concateStr);