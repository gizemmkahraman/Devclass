import { LightningElement, api } from 'lwc';

export default class Slider extends LightningElement {
    @api sliderLabel;
    @api sliderValue;

    @api resetProgress(){
        this.sliderValue = 10;
        this.sliderLabel = undefined;
    }
}