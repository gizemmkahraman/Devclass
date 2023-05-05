import { LightningElement } from 'lwc';
import PRODUCT_OBJECT from '@salesforce/schema/EcommerceProduct__c';
import TITLE_FIELD from '@salesforce/schema/EcommerceProduct__c.Title__c';
import PRICE_FIELD from '@salesforce/schema/EcommerceProduct__c.Price__c';
import RATING_FIELD from '@salesforce/schema/EcommerceProduct__c.Rating__c';
import BRAND_FIELD from '@salesforce/schema/EcommerceProduct__c.Brand__c';
import STOCK_FIELD from '@salesforce/schema/EcommerceProduct__c.Stock__c';
import CATEGORY_FIELD from '@salesforce/schema/EcommerceProduct__c.Category__c';

export default class RecordViewFormProduct extends LightningElement {
    objectname = PRODUCT_OBJECT;
    recordId = "a05Dn0000025qusIAA";

    fields = {
        title: TITLE_FIELD,
        price: PRICE_FIELD,
        rating: RATING_FIELD,
        brand: BRAND_FIELD,
        stock: STOCK_FIELD,
        category: CATEGORY_FIELD
    }
}