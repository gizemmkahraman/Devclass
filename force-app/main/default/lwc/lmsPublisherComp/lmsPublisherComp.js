import { LightningElement, wire } from 'lwc';
import SI_CHANNEL from '@salesforce/messageChannel/SoftInnovas__c';
import { MessageContext, publish } from 'lightning/messageService';



export default class LmsPublisherComp extends LightningElement {
    messageInput;
    
    changeHandler(event){
        this.messageInput = event.target.value;
    }

    @wire(MessageContext)
    context;

    publishHandler() {
        // prepare message
        const message = {
            lmsdata: this.messageInput
        };
        console.log(JSON.stringify(message));

        //publish message
        console.log("Before publishng the message");
        publish(
            this.context,
            SI_CHANNEL,
            message
        );
        console.log("publish complete");
    }
}