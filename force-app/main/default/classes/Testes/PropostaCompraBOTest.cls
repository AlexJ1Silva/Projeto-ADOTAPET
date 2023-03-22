@isTest
public class PropostaCompraBOTest {
	 @isTest
	static void CriaComissaoPropostaSttsAgPgamentoTest() {
        // Cria os objetos de teste
        List<ConfiguracaoPropostaCompra__mdt> cpc = [SELECT Tipo__c, PercentualComissao__c, Label FROM  ConfiguracaoPropostaCompra__mdt];
       

    	Contact c = new Contact(LastName='Teste');
        
        insert c;

        Imovel__c imovel = new Imovel__c(Status__c = 'Vendido',  RecordTypeId = Schema.SObjectType.Imovel__c.getRecordTypeInfosByName().get('Apartamento').getRecordTypeId());
        insert imovel;

        PropostaCompra__c proposta = new PropostaCompra__c(Valor__c = 100000,Vendedor__c=UserInfo.getUserId() , Contact__c=c.id, Imovel__c = imovel.Id, Status__c = 'Aguardando pagamento');
        insert proposta;

        // Chama o método de teste
        Test.startTest();
        List<PropostaCompra__c> lstPropostas = new List<PropostaCompra__c>();
        lstPropostas.add(proposta);
        PropostaCompraBO p = new PropostaCompraBO();
        p.criaComissaoPropostaStatusAgPagamento(lstPropostas);
        Test.stopTest();

        // Verifica se a comissão foi criada
        Comissao__c comissao = [SELECT Status__c, Id FROM Comissao__c WHERE PropostaCompra__c = :proposta.Id];
        System.assertEquals('Em pagamento', comissao.Status__c);
    }
    
     @isTest
	   static  void PreencheDataEntregaChavesTest() {
           
           Contact c = new Contact(LastName='Test');
           
           insert c;
        
        // Criando dados de teste
        String rtImovel = Schema.SObjectType.Imovel__c.getRecordTypeInfosByName().get('Apartamento').getRecordTypeId();
        Imovel__c imovel = new Imovel__c(Status__c = 'Vendido', RecordTypeId = rtImovel);
        insert imovel;
        
        LIst<ConfiguracaoPropostaCompra__mdt> config = [SELECT Tipo__c, PercentualComissao__c, Label, DiasEntregaChavesMetadata__c FROM  ConfiguracaoPropostaCompra__mdt];
        
        
        PropostaCompra__c proposta = new PropostaCompra__c(Valor__c = 350000 , Imovel__c = imovel.Id, Contact__c=c.id, 
                                                           Status__c = 'Finalizada');
        insert proposta;
        
        // Executando o método que será testado
        List<PropostaCompra__c> lstPropostas = new List<PropostaCompra__c>{proposta};
            PropostaCompraBO p = new  PropostaCompraBO();
        p.preencheDataEntregaChaves(lstPropostas);
        
        // Verificando se o resultado esperado é igual ao resultado obtido
        proposta = [SELECT DataEntregaChaves__c FROM PropostaCompra__c WHERE Id = :proposta.Id];
        System.assertEquals(System.today().addDays(30), proposta.DataEntregaChaves__c);
    }
}