MathPractice mp = new MathPractice();
system.debug('10 ekmek ucreti ' +mp.practiseFive('Ekmek', 10));
system.debug('8 simit ucreti ' +mp.practiseFive('Simit', 8));
system.debug('5 kek ucreti ' +mp.practiseFive('Kek', 5));


decimal ort = mp.practiseThree(555, 278);
system.debug('İki Sayının Ortalaması : ' + ort);


//integer a = 555;
//integer b =278;
//2
decimal VKI = mp.practiseTwo(1.78, 85.5);
system.debug('Vücut Kitle İndeksi: ' + VKI);
//1
decimal a = 12.58;
decimal b = 15.88;
decimal cvr = mp.practiseOne(a, b);
system.debug('Dikdörtgenın çevresi --> ' + cvr);
