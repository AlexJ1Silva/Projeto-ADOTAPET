public with sharing class PetBO {
    public static void preencheDataVacinacao(List<Pet__c> lstPets){

  
        
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
            if(p.DataUltimaVacinacao__c != null){
                Integer intervalo = (Integer) mapPvIntervalo.get(p.Especie__c).IntervaloDias__c;
                System.debug('###############Intervalo Gato: ' + intervalo);
                p.DataProximaVacinacao__c = p.DataUltimaVacinacao__c + intervalo;

            }
           
        }

       


    }
}