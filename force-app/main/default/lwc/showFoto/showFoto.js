import { LightningElement, track, api } from 'lwc';
import ShowFotoController from '@salesforce/apex/ShowFotoController.getContents'
export default class ShowFoto extends LightningElement {
    baseUrl = '/sfc/servlet.shepherd/version/download/';
    listImg = [];
    showSpinner = false;
    @api recordId;

    connectedCallback(){
        this.showSpinner = true;
        
        ShowFotoController({recordId : this.recordId}).then(r=>{
            console.log(r);
            if(r){
               
                r.forEach(e => {
                    e.url = this.baseUrl+e.Id;
                    console.log('URL##################'+e.url);
                });
                 this.listImg = r;
                this.showSpinner = false;
            }
            
        });
    }

}