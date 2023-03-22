public with sharing class PetDAO {
  
    public static Pet__c getPet(String recordId){

        return [SELECT Name, Especie__c, Raca__c, DataUltimaVacinacao__c, DataProximaVacinacao__c,
        (SELECT id, Contact__r.Name, Adocao__c.Name, Pet__r.Name 
        FROM Adocoes__r)
        FROM Pet__c
        WHERE Id =:recordId
        LIMIT 1];

    }

    public static List<Pet__c> getPetIs(Set<id> recordId){

        return [SELECT Name, Especie__c, Raca__c, DataUltimaVacinacao__c, DataProximaVacinacao__c,
        (SELECT id, Contact__r.Name, Adocao__c.Name, Pet__r.Name 
        FROM Adocoes__r)
        FROM Pet__c
        WHERE Id =:recordId
        LIMIT 1];

    }
}