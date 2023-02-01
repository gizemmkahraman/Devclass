public class CollectionAssignment {
    public set<string> countriesSet = new set<string> {'India','USA','Russia','Germany','Singapore','Japan'};
    

       public list<string> lowerSet = new list<string>();
       public void printLowercase(){
        for(string eachStr : countriesSet){
            lowerSet.add(eachStr.toLowerCase());
        }
        system.debug('Countries lowercase==> ' + lowerSet);     
    }
    
       public list<string> upperSet = new list<string>();
       public void printUppercase(){
        for(string eachStr : countriesSet){  
            upperSet.add(eachStr.toUpperCase());
        }
        system.debug('Countries uppercase==> ' + upperSet);
       
    }
}