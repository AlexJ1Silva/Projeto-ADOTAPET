@isTest
public class ReprovaPropostaMaisDe40DBatchTest {

    @isTest
    static void testExecute() {
        // Criação dos registros de teste
        // 
        Contact c = new Contact(LastName='testebatch');
        insert c;
        
        Imovel__c i = new Imovel__c(Status__c='Vendido');
        
        insert i;
        
        PropostaCompra__c proposta1 = new PropostaCompra__c(Contact__c=c.id, Imovel__c = i.id, Status__c = 'Aguardando pagamento', Data__c = Date.today().addDays(-50));
        PropostaCompra__c proposta2 = new PropostaCompra__c(Contact__c=c.id, Imovel__c = i.id,Status__c = 'Aguardando pagamento', Data__c = Date.today().addDays(-50));
        PropostaCompra__c proposta3 = new PropostaCompra__c(Contact__c=c.id, Imovel__c = i.id,Status__c = 'Rascunho', Data__c = Date.today().addDays(-50));
        insert new List<PropostaCompra__c> {proposta1, proposta2, proposta3};
        
        // Execução do batch
        Test.startTest();
        Database.executeBatch(new ReprovaPropostaMaisDe40DStatusAgPgBatch());
        Test.stopTest();
        
      
        // Verificação se as propostas foram reprovas	
        // 
        set<id> p = new set<id>{proposta1.id, proposta2.id, c.id, i.id};
        List<PropostaCompra__c> propostasReprovadas = [SELECT Id, Status__c, Imovel__r.Status__c, Contact__c  FROM PropostaCompra__c WHERE Id IN :p];
        System.assertEquals(2, propostasReprovadas.size(), 'Deveriam ter sido reprovadas 2 propostas de compra');
        for (PropostaCompra__c proposta : propostasReprovadas) {
            System.assertEquals('Reprovada', proposta.Status__c, 'O status da proposta deveria ser Reprovada');
        }
    }
}