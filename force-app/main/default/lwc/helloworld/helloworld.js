import { LightningElement, track, wire } from 'lwc';
/* eslint-disable no-console */
 /* eslint-disable no-alert */

import lwcmethod from '@salesforce/apex/myirstVscsclass.lwcmethod';
export default class Helloworld extends LightningElement {
    /*@track greeting='World';
    changehandler(event)
    {
        this.greeting=event.target.value;
    }*/

    @wire(lwcmethod)
    contacts;
    handleClick(event)
    {
        alert(event.target.id);

    }
   
}