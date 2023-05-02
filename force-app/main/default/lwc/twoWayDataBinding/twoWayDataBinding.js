import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {
    fullName = "Gizem";
    title =" Salesforce Developer";
    age = 26;
    titleChangeHandler(event){
       this.title =  event.target.value;
    }
}