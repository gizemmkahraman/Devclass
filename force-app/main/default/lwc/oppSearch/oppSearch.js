import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import gettOppsByStage from '@salesforce/apex/OpportunityController.gettOppsByStage';

import OPP_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';


const COLUMNS = [
    {label: "Opportunity Name", fieldName: "Name" , type: "text"},
    {label: "Type", fieldName: "Type" , type: "text"},
    {label: "Amount", fieldName: "Amount" , type: "currency"},
    {label: "Close Date", fieldName: "CloseDate" , type: "date"}
];
export default class OppSearch extends LightningElement {
    opps;
    error= "Select a stage in order to see the opportunities available under that";
    selectedStage;
    stageOptions = [];
    columns = COLUMNS;
    

    changeHandler(event){
        this.selectedStage = event.target.value;
        gettOppsByStage({stage: this.selectedStage})
        .then(result => {
            if(result.length > 0){
                this.opps = result;
                this.error = undefined;
            }else { 
                this.opps = undefined;
                this.error = "No opportunities belongs to the selected stage. Try select another one!"
            }
        })
        .catch(error =>{
            this.error = error;
            this.opps = undefined;
        })
    }

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    oppInfo;

     @wire(getPicklistValues, {
        fieldApiName : STAGE_FIELD,
        recordTypeId : '$oppInfo.data.defaultRecordTypeId'
     }) picklistHandler({data, error}){
        if(data){
            this.stageOptions = data.values;
        }
     }
}