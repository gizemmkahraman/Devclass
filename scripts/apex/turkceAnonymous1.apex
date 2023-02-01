date marie = date.newInstance(1867, 11, 7);
system.debug('Marie Cruienin doğum günü ' + marie);

date today = date.today();
system.debug('Bugünün tarihi ' + today);

Integer betweenDays = marie.daysBetween(today);
integer byD = betweenDays / 365;
system.debug('Farkın gün dikkate alınarak hesaplanması --> ' + byD);

Integer betweenMonths = marie.monthsBetween(today);
integer byM = betweenMonths / 12;
system.debug('Farkın ay dikkate alınarak hesaplanması --> ' + byM);

integer marieyear = marie.year();
integer year = today.year();
integer betweenYears = year - marieyear;
system.debug('Farkın yıl dikkate alınarak hesaplanması --> ' + betweenYears);

system.debug('Marie Cruienin doğum yılı artık yıl mı? ' + date.isLeapYear(1867));

