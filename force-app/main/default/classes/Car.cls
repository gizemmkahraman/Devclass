public class Car {
    //variables created directly in class are class variables.
    //class variables can have access modifier.
    public string carColor = '';
    public string carName;

    //default is private.
    integer maxSpeed = 140;

    public void switchOn(){
     system.debug('starting the car noww!');
    }

    public void drive(){
     system.debug('driving ' + carName);
    }

    public void driveAtMaxSpeed(){
        //we can access public and private class variables inside public method of the class.
        string description = ('driving ' + carName + 'with car color ' + carColor + ' at ' + maxSpeed + ' km/h ');
        system.debug(description);
    }
}
