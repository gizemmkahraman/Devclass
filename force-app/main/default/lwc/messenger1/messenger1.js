import { LightningElement, wire } from 'lwc';
import MYCHANNEL from '@salesforce/messageChannel/MyChannel__c';
import { APPLICATION_SCOPE, MessageContext, publish, subscribe } from 'lightning/messageService';

export default class Messenger1 extends LightningElement {

    messages = [];
    message = {};

    @wire(MessageContext)
    context;

    changeHandler(event) {
        this.message['sender'] = "Bala";
        this.message['content'] = event.target.value;
    }
    
    sendHandler() {
        const message = {
            lmsdata: this.message
        };
        publish(
            this.context,
            MYCHANNEL,
            message
        );
    }

    connectedCallback() {
        this.subscribeHandler();
    }

    subscribeHandler() {
        subscribe(
            this.context,
            MYCHANNEL,
            (message) => { this.handleMessage(message) },
            { scope: APPLICATION_SCOPE }
        );
    }

    handleMessage(message) {
        this.messages = [...this.messages, message.lmsdata];
    }
}