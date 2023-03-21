import { LightningElement, track,api } from 'lwc';
import arquivosFotosCLS from '@salesforce/apex/UploadPhotoController.arquivosFotos';
import deleteFotoCLS from '@salesforce/apex/UploadPhotoController.deleteFoto';
export default class Fileupload extends LightningElement {
    @api recordId;
    @track lstAllFiles;
    @track error;
    @track fotoId;
    get acceptedFormats() {
        return ['.pdf','.png','.jpg'];
    }
 
   /*  handleUploadFinished(event) {
        this.connectedCallback();
    } */
 
    connectedCallback() {
        arquivosFotosCLS({recordId:this.recordId})
        .then(result=>{
            this.lstAllFiles = result; 
           
           
        });
    }
    
    apagar(event){
        let targetId = event.target.value;
        console.log('####################ID')
        console.log(targetId);

        deleteFotoCLS({"fotoId" : targetId});
        
       /*  const apagaEvent = new CustomEvent('apagar', {
            detail: {
              apagar: targetId
            }
          })
          this.dispatchEvent(apagaEvent); 
           */
          //console.log("###>>>>_apagar_<<<<<<#####");
    }
}