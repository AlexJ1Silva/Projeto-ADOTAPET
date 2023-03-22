@isTest
public class PropostaCompraDAOTest {
 @isTest
    public static void testGetPropostaCompraIdList() {
        
        Imovel__c imovel = new Imovel__c();
        imovel.Metragem__c = 100;
        imovel.ValorBase__c = 500000;
        insert imovel;
        
        Contact contato = new Contact();
        contato.LastName = 'Silva';
        insert contato;
        
        PropostaCompra__c proposta = new PropostaCompra__c();
        proposta.Imovel__c = imovel.Id;
        proposta.Contact__c = contato.Id;
        proposta.Valor__c = 450000;
        insert proposta;
        
        PropostaCompra__c proposta1 = new PropostaCompra__c();
        proposta1.Status__c = 'Rascunho';
        proposta1.Contact__c = contato.id ;
        proposta1.Imovel__c = imovel.id;
        insert proposta1;
        
        PropostaCompra__c proposta2 = new PropostaCompra__c();
        proposta2.Status__c = 'Rascunho';
        proposta2.Contact__c = contato.id ;
        proposta2.Imovel__c = imovel.id;
        insert proposta2;
        
        Set<Id> propostaIds = new Set<Id>{proposta1.Id, proposta2.Id};
        
        List<PropostaCompra__c> result = PropostaCompraDAO.getPropostaCompraIdList(propostaIds);
        
        System.assertEquals(2, result.size());
        System.assertEquals(proposta1.Id, result[0].Id);
        System.assertEquals(proposta2.Id, result[1].Id);
    }
    
    @isTest
    public static void testGetPropostaCompra() {
        Imovel__c imovel = new Imovel__c();
        imovel.Metragem__c = 100;
        imovel.ValorBase__c = 500000;
        insert imovel;
        
        Contact contato = new Contact();
        contato.LastName = 'Silva';
        insert contato;
        
        PropostaCompra__c proposta = new PropostaCompra__c();
        proposta.Imovel__c = imovel.Id;
        proposta.Contact__c = contato.Id;
        proposta.Valor__c = 450000;
        insert proposta;
        
        PropostaCompra__c result = PropostaCompraDAO.getPropostaCompra(proposta.Id);
        
 
        System.assertEquals(contato.LastName, result.Contact__r.Name);
        System.assertEquals('Apartamento', result.Imovel__r.RecordType.Name);
        System.assertEquals(100, result.Imovel__r.Metragem__c);
        System.assertEquals(500000, result.Imovel__r.ValorBase__c);
        System.assertEquals(proposta.Valor__c, result.Valor__c);
    }
    
    
}