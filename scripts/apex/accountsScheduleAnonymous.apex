string crn = '0 0 13 * * ?';

AccountSchedule acs = new AccountSchedule();
system.schedule('accountSchedule22', crn, acs);