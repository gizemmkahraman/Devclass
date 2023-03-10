list<account> listAcc = [SELECT Id, Name FROM Account LIMIT 50];
AccountsQueueable aq = new AccountsQueueable(listAcc);
id jobId =system.enqueueJob(aq); //we can enqueue the class which implements queueable.

//AccountsQueueable aq = new AccountsQueueable();// this will not work.

list<account> listAcc2 = [SELECT Id, Name FROM Account WHERE Name LIKE '%----SI'];
AccountsQueueable2 aq2 = new AccountsQueueable2(listAcc2);
id jobId =system.enqueueJob(aq2);


