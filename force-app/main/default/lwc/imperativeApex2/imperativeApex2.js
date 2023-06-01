import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import gettOppsByStage from '@salesforce/apex/OpportunityController.gettOppsByStage';


const COLUMNS =[
    {label: "Opp Name", fieldName: "Name", Type:"text"},
    {label: "Type", fieldName: "Type", Type:"text"},
    {label: "Amount", fieldName: "Amount", Type:"currency"},
    {label: "Close Date", fieldName: "CloseDate", Type:"date"}
];

export default class ImperativeApex2 extends LightningElement {
    stageOptions = [];
    selectedStage;
    opps;
    error;
    columns = COLUMNS;

    changeHandler(event){
        this.selectedStage =event.target.value;
        gettOppsByStage({stage: this.selectedStage})
        .then(result => {
            this.opps = result;
        })
        .catch(error => {
            this.error = error;
        })
    }

    @wire(getObjectInfo, {objectApiName :OPP_OBJECT})
    oppInfo;


    @wire(getPicklistValues,{
        fieldApiName: STAGE_FIELD,
        recordTypeId: '$oppInfo.data.defaultRecordTypeId'
    })picklistHandler({data,error}){
        if(data){
            this.stageOptions = data.values;
        }
    }

}