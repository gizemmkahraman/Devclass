import { LightningElement } from 'lwc';

export default class GrandParentComp extends LightningElement {

    showHandler(event){
        console.log("show event has composed to show boundry and reached grandparent");
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);

    }
}