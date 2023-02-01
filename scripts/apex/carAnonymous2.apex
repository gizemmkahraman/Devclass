car vw = new Car();
vw.carColor = 'white';
vw.carName = 'polo';
vw.switchOn();
vw.drive();
vw.driveAtMaxSpeed();







Car bm = new Car();
bm.carColor = 'black';
system.debug('bm ---> ' + bm);
bm.switchOn();
system.debug('bm color ---> ' + bm.carColor);


Car lm = new Car();
lm.carColor = 'red';
//lm.maxSpeed = 200 ; private
 lm.switchOn();
 system.debug('lm max speed --> ' + lm.maxSpeed); //it wont work beacuse private