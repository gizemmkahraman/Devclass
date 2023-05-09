import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import TITLE_FIELD from '@salesforce/schema/EcommerceProduct__c.Title__c';
import BRAND_FIELD from '@salesforce/schema/EcommerceProduct__c.Brand__c';
import CATEGORY_FIELD from '@salesforce/schema/EcommerceProduct__c.Category__c';
import PRICE_FIELD from '@salesforce/schema/EcommerceProduct__c.Price__c';
import DISCOUNT_FIELD from '@salesforce/schema/EcommerceProduct__c.DiscountPercentage__c';
import RATING_FIELD from '@salesforce/schema/EcommerceProduct__c.Rating__c';



const FIELDS = [TITLE_FIELD, BRAND_FIELD, CATEGORY_FIELD, PRICE_FIELD, DISCOUNT_FIELD, RATING_FIELD];

export default class GetRecordProduct extends LightningElement {
    recordId = 'a05Dn0000025qusIAA';
    title;
    brand;
    category;
    price;
    disc;
    rating;

    

    @wire(getRecord, {
        recordId: '$recordId',
        fields: FIELDS
    }) productHandler({data, error}) {
        if(data) {
            console.log(data);
            this.title = data.fields.Title__c.value;
            this.brand = data.fields.Brand__c.value;
            this.category = data.fields.Category__c.value;
            this.price = data.fields.Price__c.displayValue;
            this.disc = data.fields.DiscountPercentage__c.value;
            this.rating = data.fields.Rating__c.value;
        }
        if(error) {
            console.error(error);
        } 
    }
}
