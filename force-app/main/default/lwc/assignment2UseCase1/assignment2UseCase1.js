import { LightningElement } from 'lwc';
import CASE_OBJECT from '@salesforce/schema/Case';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Case.AccountId';
import CONTACT_NAME_FIELD from'@salesforce/schema/Case.ContactId';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import DESC_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import { ShowToastEvent} from 'lightning/platformShowToastEvent';



export default class Assignment2UseCase1 extends LightningElement {
objectName = CASE_OBJECT;
recordId = '500Dn000003zhEnIAI';
fields = {
    contactName: CONTACT_NAME_FIELD,
    accountName: ACCOUNT_NAME_FIELD,
    subject: SUBJECT_FIELD,
    priority: PRIORITY_FIELD,
    status: STATUS_FIELD,
    description: DESC_FIELD,
    origin: ORIGIN_FIELD,
};
  successHandler(){
    const evt = new ShowToastEvent({
        title: "Success",
        message: "Case information has been updated successfully!",
        variant:"success"

    });
    this.dispatchEvent(evt);
  }
  errorHandler(){
    const evt = new ShowToastEvent({
        title: "Error",
        message: "Error occurred! Record was not saved!",
        variant:"error"
        //mode:sticky 

    });
    this.dispatchEvent(evt);
  }
}