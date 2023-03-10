AccountsBatch ab = new AccountsBatch();
Database.executeBatch(ab, 50);
//Database.executeBatch(ab); //default number of record is 200.