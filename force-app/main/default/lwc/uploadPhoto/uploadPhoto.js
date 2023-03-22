import { LightningElement, track, api, wire } from 'lwc';
import arquivosFotosCLS from '@salesforce/apex/UploadPhotoController.arquivosFotos';
import deleteFotoCLS from '@salesforce/apex/UploadPhotoController.deleteFoto';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex'
//import getListaDocumentos from '@salesforce/apex/UploadPhotoController.listaDocumentos'
export default class Fileupload extends LightningElement {
    @api recordId;
    @track lstAllFiles = [];
    @track error;
    @track fotoId;
    @track wirelstAllFIles = [];
    get acceptedFormats() {
        return ['.pdf', '.png', '.jpg'];
    }

    


    handleUploadFinished(event) {
        this.showToast('Sucesso', 'Upload efetuado!!', 'success')
        this.connectedCallback();
    }

    connectedCallback() {
        arquivosFotosCLS({ recordId: this.recordId })
            .then(result => {
                this.lstAllFiles = result;
                
            });
            
    }

   /*  @wire(getListaDocumentos) fotosList(result) {
        this.wirelstAllFIles = result;
    
        if (result.data) {
          this.lstAllFiles = result.data;
          this.error = undefined;
        } else if (result.error) {
          this.error = result.error;
          this.lstAllFiles = [];
        }
      } */


    apagar(event) {
        let targetId = event.target.value;

        console.log(targetId);

        deleteFotoCLS({ "fotoId": targetId }).then(r=>{
            this.connectedCallback();
        });
        this.showToast('Sucesso', 'Item Deletado', 'success')
        
        //refreshApex(this.wirelstAllFIles);

        /*  const apagaEvent = new CustomEvent('apagar', {
             detail: {
               apagar: targetId
             }
           })
           this.dispatchEvent(apagaEvent); 
            */
        //console.log("###>>>>_apagar_<<<<<<#####");
    }

    showToast(titulo, msg, variant) {
        const event = new ShowToastEvent({
            title: titulo,
            message: msg,
            variant: variant,
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }
}