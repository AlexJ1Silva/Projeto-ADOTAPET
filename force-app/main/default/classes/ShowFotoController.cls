public with sharing class ShowFotoController {
    
    @AuraEnabled
    public static List<ContentVersion> getContents(String recordId){
    Set<Id> contentIds = new Set<Id>();

        for (ContentDocumentLink cont :[Select ContentDocument.Id from ContentDocumentLink WHERE LinkedEntityId = :recordId]) {
            contentIds.add(cont.ContentDocument.Id);
        }

        return [SELECT Id,Title FROM ContentVersion WHERE ContentDocumentId IN :contentIds];
    }
    
}