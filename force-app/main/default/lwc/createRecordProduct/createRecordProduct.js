import { LightningElement, wire } from 'lwc';
import PRODUCT_OBJECT from '@salesforce/schema/EcommerceProduct__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
export default class CreateRecordProduct extends LightningElement {

    formdata={};
    @wire(getObjectInfo, {objectApiName: PRODUCT_OBJECT})
    productInfo;
    changeHandler(event){
        const name = event.target.name;
        const value= event.target.value;
        this.formdata[name] = value;
        console.log(JSON.stringify(this.formdata));
    }

    cancelHandler(){
        this.template.querySelector('form.productform').reset();
        this.template.querySelector('lightning-combobox.brandbox').value=undefined;
        this.template.querySelector('lightning-combobox.categorybox').value=undefined;
        this.formdata = {};
    }

    saveHandler(){
        const recordInput={
            apiName: PRODUCT_OBJECT.objectApiName,
            fields:this.formdata
        };
        createRecord(recordInput)
        .then(result =>{
            this.cancelHandler();
            this.successMessage();
        })
        .catch(error =>{
            console.log("Error");
        });
    }

    successMessage(){
        const event = new ShowToastEvent({
            title: " Success",
            message:"Product has been created successfully!",
            variant:"success"
        }); this.dispatchEvent(event);
    }

    get brandOptions(){
        return[
            {label: "Samsung", value: "Samsung"},
            {label: "Apple", value: "Apple"},
            {label: "Blackberry", value: "Blackberry"},
            {label: "Nokia", value: "Nokia"},
        ];
    }

    get categoryOptions() {
        return [
            {label: "Smartphones", value: "Smartphones"},
            {label: "Tablets", value: "Tablets"},
            {label: "Refrigerators", value: "Refrigerators"},
            {label: "Air Conditioners", value: "Air Conditioners"},
            {label: "Smart Watches", value: "Smart Watches"},
            {label: "Head Phones", value: "Head Phones"}
        ];
    }
     
}