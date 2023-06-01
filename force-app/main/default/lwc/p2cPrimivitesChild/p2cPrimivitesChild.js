import { LightningElement, api } from 'lwc';

export default class P2cPrimivitesChild extends LightningElement {
    @api fullname;
    @api standard;
    @api studentAge;
}