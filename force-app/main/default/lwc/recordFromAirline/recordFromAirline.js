import { LightningElement } from 'lwc';
import AIRLINE_OBJECT from '@salesforce/schema/Airlines__c';
import NAME_FIELD from '@salesforce/schema/Airlines__c.Name__c';
import COUNTRY_FIELD from '@salesforce/schema/Airlines__c.Country__c';
import SLOGAN_FIELD from '@salesforce/schema/Airlines__c.Slogan__c';
import ESTABLISHED_FIELD from '@salesforce/schema/Airlines__c.Established__c';
import HEAD_QUATERS_FIELD from '@salesforce/schema/Airlines__c.Head_Quaters__c';
import LOGO_FIELD from '@salesforce/schema/Airlines__c.Logo__c';
import LOGOURL_FIELD from '@salesforce/schema/Airlines__c.LogoURL__c';
import WEBSITE_FIELD from '@salesforce/schema/Airlines__c.Website__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class RecordFromAirline extends LightningElement {
    objectName = AIRLINE_OBJECT;
    recordId= "a08Dn0000037WohIAE";
    fields=[NAME_FIELD, COUNTRY_FIELD, SLOGAN_FIELD, ESTABLISHED_FIELD, HEAD_QUATERS_FIELD, LOGO_FIELD, LOGOURL_FIELD, WEBSITE_FIELD];
    

    successHandler(){
        const evt = new ShowToastEvent({
            title: "Success",
            message: "Airline detail has been saved successfully.",
            variant:"success"
        });
        this.dispatchEvent(evt);
    }
}