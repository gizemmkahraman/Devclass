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

export default class RecordViewFormAirlines extends LightningElement {
    objectName = AIRLINE_OBJECT;
    recordId ="a08Dn0000037WohIAE";

    fields = {
        name: NAME_FIELD,
        country: COUNTRY_FIELD,
        slogan: SLOGAN_FIELD,
        established: ESTABLISHED_FIELD,
        headQuaters: HEAD_QUATERS_FIELD,
        logo: LOGO_FIELD,
        logoUrl: LOGOURL_FIELD,
        website: WEBSITE_FIELD
    }
}