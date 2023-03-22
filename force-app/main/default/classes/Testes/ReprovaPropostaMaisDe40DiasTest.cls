@isTest
public class ReprovaPropostaMaisDe40DiasTest {

    static testMethod void test() {
        
         List<Imovel__c> lstImovel = new List<Imovel__c>();
          for(integer i = 0; i <5; i++){
            Imovel__c im = new Imovel__c();
            im.Status__c = 'Vendido';
            lstImovel.add(im);
        }
        
        insert lstImovel;
        
         List<Contact> listaC = new List<Contact>();
        for(integer i = 0 ; i <5; i++){
		Contact c = new Contact();
            c.LastName = 'Test' +i;
            listaC.add(c);
        }
        
        insert listaC;
        
        // Criação de dados de teste
        List<PropostaCompra__c> propostaList = new List<PropostaCompra__c>();
        for(Integer i=0; i<5; i++) {
            PropostaCompra__c p = new PropostaCompra__c();
            p.Status__c = 'Em análise';
            p.Contact__c = listaC[i].id;
            p.Imovel__c = lstImovel[i].id;
            propostaList.add(p);
        }
        insert propostaList;
        
        // Execução do código de teste
        Test.startTest();
        PropostaCompraBO reprova = new PropostaCompraBO();
        reprova.reprovaPropostaMaisDe40Dias(propostaList);
        Test.stopTest();
        
        // Verificação dos resultados
        
        List<PropostaCompra__c> updatedPropostaList = [SELECT Id, Status__c FROM PropostaCompra__c WHERE Id IN :propostaList];
        System.assertEquals(5, updatedPropostaList.size());
        for(PropostaCompra__c p : updatedPropostaList) {
            System.assertEquals('Reprovada', p.Status__c);
        }
    }
}