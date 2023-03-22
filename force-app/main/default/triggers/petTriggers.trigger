trigger petTriggers on Pet__c (before insert, after insert, after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            PetBO.preencheDataVacinacao(Trigger.new);
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
            for(Pet__c p : Trigger.new){
                if(p.DataUltimaVacinacao__c != null){
                    PetBO.preencheDataVacinacao(Trigger.new);
                }
            }
        }
    }
   
}