trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    system.debug('----- trigger start -----');
   
    if (Trigger.isBefore) {
        //call handler method
        AccountTriggerHandler.updateDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.Oldmap);
    }

    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('Trigger.isAfter ' + Trigger.isAfter);
        system.debug('Trigger.isUpdate ' + Trigger.isUpdate);
        //call handler method to update vip of all contacts.
        AccountTriggerHandler.updateVIPforAllContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.Oldmap);
    }
    //if (Trigger.isBefore && Trigger.isInsert) {
       // AccountTriggerHandler.tryCatchContact(trigger.new);
    }















 // Map<id, account> trgNewMap = trigger.newMap;
    // //trigger.new --> list<account> list of account records
    // //ID --> Record as value 
    // Map<id, account> trgOldMap = trigger.oldMap;


    // if (Trigger.isBefore && Trigger.isUpdate ) {
    //     integer countWebsiteChange = 0;

    //     for (Id eachId : trgNewMap.keySet() ) {
    //         Account newAccount = trgNewMap.get(eachId);
    //         Account oldAccount = trgOldMap.get(eachId);

    //         system.debug('new account website field value ' + newAccount.Website);
    //         system.debug('old account website field value ' + oldAccount.Website);
    //         //check if website field is CHANGED. 
    //             //compare old and new value of website field.
    //         if (newAccount.website != oldAccount.Website ) {
    //             system.debug('for account ' + newAccount.Name + ', new website is ' + newAccount.Website);
    //             countWebsiteChange++;
    //         } 
    //     }
    //     system.debug('number of records where website is changed ' + countWebsitechange);
    // }
    //List<account> accTriggerNew = trigger.new;

    // if (Trigger.isAfter && Trigger.isUpdate) {
    //     set<id> setIds = trgNewMap.keySet();
        
    //     for (Id eachID : setIds) {
    //         system.debug(eachID);
    //         //get NEW Account from eachID (key)
    //         //.get method of map to get account record
    //         Account newAcc = trgNewMap.get(eachId); 
    //         Account oldAcc = trgOldMap.get(eachId); 

    //         string newName = newAcc.Name;
    //         string oldName = oldAcc.Name;

    //         system.debug('new account name is ' + newName +', old account name WAS ' + oldName);
    //         //system.debug('new account name is v2 ' + trigger.newMap.get(eachId).Name);
    //     }
    // }

    // if (Trigger.isBefore && Trigger.isInsert) {
    //     system.debug('====BEFORE INSERT====');
    //     system.debug('trigger.newMap -> ' + trgNewMap);//ID is null. So newMap is NULL.
    //     system.debug('trigger.oldMap -> ' + trgOldMap);//Old is null. So oldMap is also NULL, obviously.
    // }
    // if (Trigger.isAfter && Trigger.isInsert) {
    //     system.debug('====AFTER INSERT====');
    //     system.debug('trigger.newMap -> ' + trgNewMap);//yes
    //     system.debug('trigger.oldMap -> ' + trgOldMap);//Old is null. So oldMap is also NULL, obviously.
    // }

    // if (Trigger.isBefore && Trigger.isUpdate) {
    //     system.debug('====BEFORE UPDATE====');//newMap in beforeUpdate? name of acc?
    //     system.debug('trigger.newMap -> ' + trgNewMap);//yes
    //     system.debug('trigger.oldMap -> ' + trgOldMap);//yes
    // }
    // if (Trigger.isAfter && Trigger.isUPDATE) {
    //     system.debug('====AFTER UPDATE====');
    //     system.debug('trigger.newMap -> ' + trgNewMap);//yes
    //     system.debug('trigger.oldMap -> ' + trgOldMap);//yes
    // }


    // if(trigger.isAfter && trigger.isUpdate){
    //     //print old and new id and names
    //     list<account> newAccounts = trigger.new;
    //     list<account> oldAccounts = trigger.old;

    //     for (account oldAcc : oldAccounts) {
    //         system.debug('old acc id is ' + oldAcc.id + ' , old name is ' + oldAcc.name);
    //     }
        
    //     for (account newAcc : newAccounts) {
    //         system.debug('new acc id is ' + newAcc.id + ' , new name is ' + newAcc.name);
    //     }
    // }

    // if (Trigger.isBefore && Trigger.isinsert) {
    //     system.debug('trigger.old in BEFORE INSERT -->  ' + trigger.old); //null
       
    // }
    // if (Trigger.isAfter && Trigger.isinsert) {
    //     system.debug('trigger.old in AFTER INSERT -->  ' + trigger.old); //null
    // }

    // if (Trigger.isBefore && Trigger.isUpdate) {
    //     system.debug('trigger.old in BEFORE UPDATE -->  ' + trigger.old); //
       
    // }
    // if (Trigger.isAfter && Trigger.isUpdate) {
    //     system.debug('trigger.old in AFTER UPDATE -->  ' + trigger.old); //
    // }


    // if (Trigger.isBefore && Trigger.isinsert) {
    //     system.debug('trigger.new in BEFORE INSERT -->  ' + trigger.new); 
    //     //.new is present. ID is null. Created date, created by, modified by are null
    // }
    // if (Trigger.isAfter && Trigger.isinsert) {
    //     system.debug('trigger.new in AFTER INSERT -->  ' + trigger.new); //yes. 
    // }
    // if (Trigger.isBefore && Trigger.isUpdate) {
    //     system.debug('trigger.new in BEFORE Update -->  ' + trigger.new);//yes
    //     //last modified date will be older.
    // }
    // if (Trigger.isAfter && Trigger.isUpdate) {
    //     system.debug('trigger.new in AFTER Update -->  ' + trigger.new);//yes
    //     //last modified date will be updated
    // }

    // List<account> newAccounts = trigger.new;
    // if(Trigger.isAfter){
    //     system.debug('after insert/update new records : ' + newAccounts);
    //     system.debug('number of records inserted/updated: ' + newAccounts.size());

    //     for (Account eachAcc : newAccounts) {
    //         system.debug('new acc id is ' + eachAcc.Id + ', new acc name is ' + eachAcc.Name);
    //     }
    // }

    //system.debug('===== trigger end =====');

    // system.debug('Trigger.isBefore -> ' + Trigger.isBefore);
    // system.debug('Trigger.isAfter -> ' + Trigger.isAfter);

    // system.debug('Trigger.isInsert -> ' + Trigger.isInsert);
    // system.debug('Trigger.isUpdate -> ' + Trigger.isUpdate);


    //will be true for AFTER INSERT
    // if(Trigger.isAfter && Trigger.isInsert){
    //     system.debug('after insert trigger called.');
    // }

    // //will be true for BEFORE INSERT
    // if(Trigger.isBefore && Trigger.isInsert){
    //     system.debug('before insert trigger called.');
    // }

    // //will be true for AFTER UPDATE
    // if(Trigger.isAfter && Trigger.isUpdate){
    //     system.debug('after update trigger called.');
    // }
    // //will be true for BEFORE UPDATE
    // if(Trigger.isBefore && Trigger.isUpdate){
    //     system.debug('before update trigger called.');
    // }
    
   


    /*
    //.isInsert will be true when TRIGGER is running while INSERTing 
    system.debug('trigger.isInsert --> ' + trigger.isInsert); 
    if(trigger.isInsert){
        system.debug('before insert trigger called.');
    }
    system.debug('trigger.isUpdate --> ' + trigger.isUpdate);
    if(trigger.isUpdate){
        system.debug('before update trigger called.');
    }

   */

    /*
    system.debug('Trigger.isBefore --> ' + Trigger.isBefore);
    system.debug('Trigger.isAfter --> ' + Trigger.isAfter);
    if(Trigger.isBefore){
        system.debug('before insert trigger called.');
    }
    if(Trigger.isAfter){
        system.debug('after insert trigger called.');
    }

    */

















          /* Map<id, account> trgNewMap = trigger.newMap;
           Map<id, account> trgOldMap = trigger.oldMap;

           if(trigger.isBefore && trigger.isUpdate){
            integer countWebsiteChange = 0;
                for (Id eachId : trgNewMap.keySet()) {
                    Account newAccount =trgNewMap.get(eachId);
                    Account oldAccount =trgOldMap.get(eachId);

                    system.debug('new account website field value  ' + newAccount.Website);
                    system.debug('old account website field value  ' + oldAccount.Website);
                    //check if website field is changed.
                     //compare old and new value of website field.
                    if(newAccount.website != oldAccount.website){
                        system.debug('for account ' + newAccount.Name + ', website is ' + newAccount.Website);
                        countWebsiteChange++;
                    }
                }
                system.debug('number of records where website is changed ' + countWebsiteChange ); */
            



               // list<account> accTriggerNew = trigger.new;
               /* if(trigger.isAfter && trigger.isUpdate){
                    set<id> setIds = trgNewMap.keySet();

                    for (Id eachId : setIds) {
                        //get new account from eachId (key)
                        //.get method of to get account record
                        Account newAcc = trgNewMap.get(eachId);
                        Account oldAcc = trgOldMap.get(eachId);
                        string newName = newAcc.Name;
                        string oldName = oldAcc.Name;
                        system.debug('new account name is ' + newName + ', old account name was ' + oldName);
                        //system.debug('new account name is v2 ' + trigger.newMap.get(eachId).Name);
                    }*/
                  /*  for (Account eachNewAccount : accTriggerNew) {
                        string newAccName = eachNewAccount.Name;
            
                        Account oldAcc = trgOldMap.get(eachNewAccount.Id);
                        string oldAccName = oldAcc.Name;
                        system.debug('new acc name ' + newAccName + ', old acc name ' + oldAccName);
                    } */
                





           /*
                if(trigger.isBefore && trigger.isInsert){
                    system.debug('=====BEFORE INSERT=====');
                    system.debug('TRIGGER.newMap => ' + trgNewMap); // ID is null. so newMap is null.
                    system.debug('TRIGGER.oldMap => ' + trgOldMap);//old is null oldMap is null
                }
                if(trigger.isAfter && trigger.isInsert){
                    system.debug('=====BEFOREAFTER INSERT=====');
                    system.debug('TRIGGER.newMap => ' + trgNewMap); //YES
                    system.debug('TRIGGER.oldMap => ' + trgOldMap);//old is null oldMap is null
                }
                if (Trigger.isBefore && Trigger.isUpdate) {
                    system.debug('====BEFORE UPDATE====');
                    system.debug('trigger.newMap -> ' + trgNewMap);//yes
                    system.debug('trigger.oldMap -> ' + trgOldMap);//yes
                }
                if (Trigger.isAfter && Trigger.isUPDATE) {
                    system.debug('====AFTER UPDATE====');
                    system.debug('trigger.newMap -> ' + trgNewMap);//yes
                    system.debug('trigger.oldMap -> ' + trgOldMap);//yes
                }
            */



            /*if(trigger.isAfter){
                if(trigger.isUpdate){
                    for (account oldAcc : trigger.old) {
                        system.debug('old acc id = ' + oldAcc.id + ' , old acc name is = ' + oldAcc.Name);
                    }
                    for (account newAcc : trigger.new) {
                        system.debug('newacc id = ' + newAcc.id + ' , new acc name is = ' + newAcc.Name);
                    }
                }


            }/*
            /*if(trigger.isBefore && trigger.isInsert){
                system.debug('trigger.old in before insert --> ' + trigger.old);//null
            }
            if(trigger.isAfter && trigger.isInsert){
                system.debug('trigger.old in afterinsert --> ' + trigger.old);//null
            }
            if(trigger.isBefore && trigger.isUpdate){
                system.debug(' trigger.old in before update ' + trigger.old);
            } 
            if(trigger.isAfter && trigger.isUpdate){
                system.debug(' trigger.old in after update ' + trigger.old);
            } */


          /*  if(trigger.isBefore && trigger.isInsert){
                system.debug('trigger .new in before insert --> ' + trigger.new);// id is null created date,created by , modified by are null.
            }
            //will be true after insert
            if(trigger.isAfter && trigger.isInsert){
                system.debug('trigger .new in afterinsert --> ' + trigger.new);
            }
            //will be true before update
            if(trigger.isBefore && trigger.isUpdate){
                system.debug(' trigger.new in before update ' + trigger.new);
            } //last modified date will be older.
            //will be true after update
            if(trigger.isAfter && trigger.isUpdate){
                system.debug(' trigger.new in after update ' + trigger.new);
            } // last modified date will be updated.*/


   /*list<account> newAccounts = trigger.new;
    if(trigger.isAfter){
        system.debug('after insert/update new records ' + trigger.new);
        system.debug('list size is ' + newAccounts.size());
    }

     for (account  eachAcc : newAccounts) {
        system.debug('new account id  ' + eachAcc.Id + ', new account name is ' + eachAcc.Name);
     }*/
    //system.debug('-------trigger end--------');
    /*
    system.debug('trigger.isBefore ' + trigger.isBefore);
    system.debug('trigger.isAfter ' + trigger.isAfter);

    system.debug('trigger.isInsert ' + trigger.isInsert);
    system.debug('trigger.isUpdate ' + trigger.isUpdate);
    
    //will be true before insert
    if(trigger.isBefore && trigger.isInsert){
        system.debug('before insert trigger called.');
    }
       //will be true after insert
    if(trigger.isAfter && trigger.isInsert){
        system.debug('after insert trigger called.');
    }
       //will be true before update
    if(trigger.isBefore && trigger.isUpdate){
        system.debug('before iupdate trigger called.');
    }
      //will be true after update
    if(trigger.isAfter && trigger.isUpdate){
        system.debug('after update trigger called.');
    } */
   




    /*
    //.isinsert will be true when trigger is running while inserting.
    system.debug('trigger.isInsert == > ' + trigger.isInsert);

    if(trigger.isInsert){
        system.debug('before insert trigger called.');

    }
    system.debug('trigger.isUpdate == > ' + trigger.isUpdate);
    if(trigger.isUpdate){
        system.debug('before update trigger called.');
    }
    system.debug('-------trigger end--------'); */

    /*
    system.debug('Trigger.isBefore ===> ' + Trigger.isBefore);
    system.debug('Trigger.isAfter ===> ' + Trigger.isAfter);
    if(Trigger.isBefore){
    system.debug('before insert trigger called.');
    }
    if(Trigger.isAfter){
    system.debug('after insert trigger called.');
    }

    system.debug('-------trigger end--------'); */