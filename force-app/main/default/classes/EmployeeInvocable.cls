public with sharing class EmployeeInvocable {
    @InvocableMethod(label='Send Employee Information' 
    description='Post the newly created aemployee record.' 
    category='Employees')
    public static void sendAirlines(List<Id> employeeIds){
        for(Id employeeId : employeeIds){
        RestCallouts.postEmployee(employeeId);
        }
    }
}