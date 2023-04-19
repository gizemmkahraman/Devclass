list<account> listAcc =[SELECT Id FROM Account];

list<contact> createContacts = new list<contact>();
for(integer i = 0 ; i < 500; i++){
    contact c= new contact();
    c.FirstName = 'anon';
    c.LastName = 'ymous';
    c.Email ='anonymous' + i + '@self.com';
    id accid;
    if(i<100){
        accid = listAcc[0].id;
    }else if(i <394){
        accid =listAcc[1].id;
    }else if(i<444){
        accid =listAcc[2].id;
    }else {
         accid =listAcc[3].id;
    }
    c.AccountId = accid;
    createContacts.add(c);
     }
     insert createContacts;