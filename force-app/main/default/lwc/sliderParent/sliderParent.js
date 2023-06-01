import { LightningElement } from 'lwc';

export default class SliderParent extends LightningElement {
    selectedLabel;
    selectedValue;

   
    changeHandler(event){
        if(event.target.name == "Slider Value"){
            this.selectedValue=event.target.value;
        }else{
            this.selectedLabel=event.target.value;
        }
    }
    resetHandler(){
        this.template.querySelector('c-slider').resetProgress();
    }
    }
