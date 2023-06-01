import getContacts from '@salesforce/apex/ContactController.getContacts';
import { LightningElement } from 'lwc';

export default class ContactSearch extends LightningElement {
    searchword;
    contacts;
    error = "Enter some kewords so that you can see matching contacts!";

    changeHandler(event){
     this.searchword = event.target.value; 
     getContacts({searchKey:this.searchword})  
     .then(result =>{
        this.contacts = result;
        this.error = undefined;
     })  
     .catch(error=> {
        this.error = error;
        this.contacts = undefined;
     }) 
    }

}