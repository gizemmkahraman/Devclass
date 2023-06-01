import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import DATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getFieldValue, getRecord , updateRecord } from 'lightning/uiRecordApi';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';

const FIELDS = [NAME_FIELD, TYPE_FIELD, STAGE_FIELD, AMOUNT_FIELD, DATE_FIELD];

export default class Assignment3UseCase1 extends LightningElement {
typeOptions= [];
stageOptions = [];
recordId = "006Dn0000051o6tIAA";
formdata = {};

changeHandler(event){
    const name = event.target.name;
    const value = event.target.value;
    this.formdata[name] = value;
}
updateHandler(){
    this.formdata["Id"] = this.recordId;
    const recordInput = {
        fields: this.formdata
    };

    updateRecord(recordInput)
        .then(result => {
            const toast = new ShowToastEvent({
                title: "Success",
                message: "Opportunity record has been updated successfully!",
                variant: "success"
            });
            this.dispatchEvent(toast);
        })
        .catch(error =>{
            const toast = new ShowToastEvent({
                title:"Error",
                message: error.body.message,
                variant: "error"
            });
            this.dispatchEvent(toast);
        })
}
    @wire(getObjectInfo,{objectApiName:OPP_OBJECT})
    oppInfo;

    @wire(getPicklistValuesByRecordType,{ objectApiName: OPP_OBJECT,recordTypeId:'$oppInfo.data.defaultRecordTypeId'}) picklistHandler({data,error}){
        if(data){
        console.log(data);
            this.typeOptions = data.picklistFieldValues.Type.values;
            this.stageOptions = data.picklistFieldValues.StageName.values;
        }
    }
    @wire(getRecord, {
        recordId: '$recordId',
        fields: FIELDS
    })opportunity;

    get name(){
        return getFieldValue(this.opportunity.data, NAME_FIELD);
    }
    get type(){
        return getFieldValue(this.opportunity.data, TYPE_FIELD);
    }
    get stageName(){
        return getFieldValue(this.opportunity.data, STAGE_FIELD);
    }
    get amount(){
        return getFieldValue(this.opportunity.data, AMOUNT_FIELD);
    }
    get closeDate(){
        return getFieldValue(this.opportunity.data, DATE_FIELD);
    }
}