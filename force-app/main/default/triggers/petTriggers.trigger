trigger petTriggers on Pet__c (before insert, after insert, after update, before update) {
    if(Trigger.isBefore){
       
            PetBO.preencheDataVacinacao(Trigger.new);
       
    }
   
}