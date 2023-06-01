import { LightningElement, wire } from 'lwc';
import SI_CHANNEL from '@salesforce/messageChannel/SoftInnovas__c';
import { APPLICATION_SCOPE, MessageContext, subscribe } from 'lightning/messageService';
export default class LmsSubscriberComp extends LightningElement {
    messageReceived;

    @wire(MessageContext)
    context;

    connectedCallback(){
        this.subscribeHandler();
    }
    subscribeHandler(){
        subscribe(
            this.context,
            SI_CHANNEL,
            (message) => { this.handleMessage(message) },
            {scope:APPLICATION_SCOPE}
        );
        }
        handleMessage(message){
            console.log("Message received: " + JSON.stringify(message));
            this.messageReceived = message.lmsdata;
        }
    
}