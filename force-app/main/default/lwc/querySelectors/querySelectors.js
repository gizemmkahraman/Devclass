import { LightningElement } from 'lwc';

export default class QuerySelectors extends LightningElement {

    fruits =["Banana", "Apple", "Cherry", "Strawberry"];
    clickHandler(){
        //query selector demo
        const h1elem = this.template.querySelector('h1');
        console.log(h1elem.innerText);
        h1elem.style.color = "#7b00ff";
        h1elem.style.border = "2px solid green"
        h1elem.style.backgroundColor = "orange";

        const pelem =this.template.querySelector("p");
        pelem.style.color = "green";
        pelem.style.border = "2px solid purple"
        pelem.style.backgroundColor = "pink";
        
        //query selectors demo
        const divelems = this.template.querySelectorAll('div.child');
        divelems.forEach(item => {
            console.log(item.innerText);
            item.setAttribute("class", "slds-align_absolute-center");
        })
    }

}