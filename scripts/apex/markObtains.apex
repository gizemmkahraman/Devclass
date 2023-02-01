Map<String,Integer> marksObtainInMaths = new Map<String,Integer>();
marksObtainInMaths.put('0111CE112', 40);
marksObtainInMaths.put('0111CE112', 19);
marksObtainInMaths.put('0111CE100', 33);
marksObtainInMaths.put('0111CE098', 40);
marksObtainInMaths.put('0111CE040', 15);
marksObtainInMaths.put('0111CE010', 30);


Set<String>rollNumberSet = marksObtainInMaths.keyset();
System.debug('== rollNumberSet =='+rollNumberSet );

List<Integer>studentMarksList = marksObtainInMaths.values();
System.debug('==studentMarksList =='+studentMarksList);

Set<String> uniqueRollNumberSet = marksObtainInMaths.keyset();
List<Integer>marksObtainList = new List<Integer>();

for(String roll:uniqueRollNumberSet){
marksObtainList.add(marksObtainInMaths.get(roll));

if(marksObtainInMaths.get(roll)<20){
System.debug(roll+'is not qualified for next class');
}
}
System.debug('==marksObtainList =='+marksObtainList);
