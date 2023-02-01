public  class PrimitiveDataTypeDemo {
    //creating a method
    public void printBasicDataType(){
//this is method body.
    string batchName = 'Batch 14';
    integer totalCandidates = 40;
    Boolean isAdminCompleted = true;

    system.debug('total candidates ==>'+ totalCandidates);

    string batchDescription = batchName + 'is the best.';
    system.debug(batchDescription);

    Decimal dec = 74.28;
    system.debug('decimal value is..' + dec);

    Long longValue = 987654321564L;
    system.debug('long value is. ' + longValue);

    Object obj1 = 'a string in object';
    Object obj2 = 99;
    Object obj3 = false;
    system.debug('obj1 is ' + obj1);
    system.debug('obj2 is ' + obj2);
    system.debug('obj3 is ' + obj3);
     ID recordId = '001Dn00000B9NFsIAN';
system.debug('record id is '+ recordId);

    }
}
