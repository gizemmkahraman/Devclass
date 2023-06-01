import { LightningElement } from 'lwc';

export default class ModalComp extends LightningElement {

    closeHandler() {
        //1.simple event
        //const evt = new CustomEvent('close');
        //this.dispatchEvent(evt);

        //2. event with primitive  data
        let info = "User wants to close the modal."
        const evt = new CustomEvent('close', {detail: info});
        this.dispatchEvent(evt);
    }

}