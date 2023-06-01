import searchStudentsByPostalCode from '@salesforce/apex/StudentCtrl.searchStudentsByPostalCode';
import { LightningElement } from 'lwc';


const COLUMNS = [
    {label: "Student Name", fieldName: "Student_Name__c", type: "text"},
    {label: "Class", fieldName: "Class__c", type: "number"},
    {label: "Mobile", fieldName: "Mobile__c", type: "text"},
    {label: "Email", fieldName: "Email__c", type: "text"},
    {label: "Postal Code", fieldName: "Postal_Code__c", type: "text"},
]
export default class StudentParent extends LightningElement {
    students;
    searchWord;
    error;
    columns= COLUMNS;

    changeHandler(event){
        this.searchWord = event.target.value;
        searchStudentsByPostalCode({searchKey: this.searchWord})
        .then(result =>{
            if(result.length > 0) {
                this.students = result;
                this.error = undefined;
            } else {
                this.students = undefined;
                this.error = "Couldn't find any matching students for the entered search criteria. Please try another!";
            }
        })
        .catch(error => {
            this.error = error;
            this.students = undefined;
        })
    } 
}