import getAccountsByIndustry from '@salesforce/apex/AccountController.getAccountsByIndustry';
import { LightningElement, wire } from 'lwc';

const COLUMNS =[
    {label:"Account Name", fieldName:"Name", type:"text"},
    {label:"Type", fieldName:"Type", type:"text"},
    {label:"Industry", fieldName:"Industry", type:"text"},
    {label:"Annual Revenue", fieldName:"AnnualRevenue", type:"currency"}
   
];
export default class WiredApex2 extends LightningElement {
     ind = "Energy";
    columns = COLUMNS;

    @wire(getAccountsByIndustry, {industry: '$ind'})
    accounts;
}