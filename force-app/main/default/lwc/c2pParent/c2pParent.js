import { LightningElement } from 'lwc';

export default class C2pParent extends LightningElement {
    showModal = false;

    clickHandler(){
        this.showModal= true;
    }

    changeHandler(event){
        this.showModal= false;
        this.message = event.detail;
    }
}