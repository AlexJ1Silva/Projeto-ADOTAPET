public with sharing class UploadPhotoController {
     @AuraEnabled
    public static List<ContentDocumentLink> arquivosFotos(String recordId){
        return [SELECT Id, LinkedEntityId, ContentDocument.CreatedDate, ContentDocument.Title, 
                        ContentDocument.ContentSize, ContentDocument.FileType 
                    FROM ContentDocumentLink  
                WHERE LinkedEntityId  =:recordId];
    }

    @AuraEnabled 
    public static Boolean deleteFoto(String fotoId){

        ContentDocumentLink docList = new ContentDocumentLink();
        docList.Id = fotoId;
  
       
       delete docList;
  
        return true;
    }
}