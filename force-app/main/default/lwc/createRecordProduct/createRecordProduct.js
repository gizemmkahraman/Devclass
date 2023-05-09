import { LightningElement } from 'lwc';

export default class CreateRecordProduct extends LightningElement {


    get brandOptions(){
        return[
            {label: "Samsung", value: "Samsung"},
            {label: "Apple", value: "Apple"},
            {label: "Blackberry", value: "Blackberry"},
            {label: "Nokia", value: "Nokia"},
        ];
    }
}