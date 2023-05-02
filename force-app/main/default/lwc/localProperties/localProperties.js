import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {
    name; //undefined
    fullName = "Gizem";
    age = 26;
    location = {
        city : "San Francisco",
        country : "United States",
        postalCode : "94777"
    };
    birds = ["Crow", "Swan", "Sparrow", "Peacock"];
}