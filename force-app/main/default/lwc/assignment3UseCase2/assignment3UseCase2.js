import getProductsByPrice from '@salesforce/apex/EcommerceController.getProductsByPrice';
import { LightningElement } from 'lwc';


 const COLUMNS =[
    {label: "Title", fieldName: "Title__c", type:"text"},
    {label: "Brand", fieldName: "Brand__c", type:"text"},
    {label: "Category", fieldName: "Category__c", type:"text"},
    {label: "Price", fieldName: "Price__c", type:"currency"},
 ];

export default class Assignment3UseCase2 extends LightningElement {
    product;
    error;
    columns = COLUMNS;
    amount;

    changeHandler(event){
        this.amount = Number(event.target.value);
        getProductsByPrice({amount : this.amount})
        .then(result => {
            //this.product=result;
            result.length === 0 ? this.product = undefined: this.product = result;
            //if (result.length === 0){
                //     this.product = undefined;
                // }
                // else {
                //     this.product = result;
                // }
        })
        .catch(error => {
            this.error =error;
        })
    }
}