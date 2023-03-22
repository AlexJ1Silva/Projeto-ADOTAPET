public with sharing class PetBO {
    public static void preencheDataVacinacao(List<Pet__c> lstPets){

        set<id> petsId = new set<id>();
        List<Pet__c> petsUpdateVacinacao = new List<Pet__c>();
        
        Map<String,PeriodicidadeVaciacao__mdt> mapPvIntervalo = new Map<String,PeriodicidadeVaciacao__mdt>();
        for(PeriodicidadeVaciacao__mdt pv : [SELECT Id, Label, Especie__c, IntervaloDias__c 
                                            FROM PeriodicidadeVaciacao__mdt ]){
                mapPvIntervalo .put(pv.Especie__c, pv);
        } 

     /*    List<PeriodicidadeVaciacao__mdt> listPeriodoVacina = new List<PeriodicidadeVaciacao__mdt>();
        for(PeriodicidadeVaciacao__mdt pv : [SELECT Id, Label, Especie__c, IntervaloDias__c 
                                            FROM PeriodicidadeVaciacao__mdt ]){
                    listPeriodoVacina.add(pv);
        }  */
        for(Pet__c p : lstPets){
            petsId.add(p.id);
        }

         
        
        for(Pet__c p : PetDAO.getPetIs(petsId)){
            if(p.Especie__c == 'Gato' && p.DataUltimaVacinacao__c != null){
                Integer intervalo = (Integer) mapPvIntervalo.get(p.Especie__c).IntervaloDias__c;
                System.debug('###############Intervalo' + intervalo);
                p.DataProximaVacinacao__c = p.DataUltimaVacinacao__c + intervalo;

            }else{
                Integer intervalo = (Integer) mapPvIntervalo.get(p.Especie__c).IntervaloDias__c;
                p.DataProximaVacinacao__c = p.DataUltimaVacinacao__c + intervalo;
            }
            petsUpdateVacinacao.add(p);
        }

        update petsUpdateVacinacao;


    }
}