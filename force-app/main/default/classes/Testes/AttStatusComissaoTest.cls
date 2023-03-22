@isTest
private class AttStatusComissaoTest {

    @isTest static void testAttStatusComissao() {
        
        Contact c = new Contact(LastName = 'Teste');
        
        insert c;
        //cria dados de teste
        Imovel__c imovel = new Imovel__c(Status__c='Disponível');
        insert imovel;

        PropostaCompra__c proposta = new PropostaCompra__c(Status__c='Finalizada', Imovel__c=imovel.Id, Contact__c=c.id);
        insert proposta;

        Comissao__c comissao = new Comissao__c(Status__c='Paga', PropostaCompra__c=proposta.Id);
        insert comissao;

        //Executa o método de atualização de status
        ComissaoBO att = new ComissaoBO();
        att.attStatusComissao(new List<PropostaCompra__c>{proposta});

        //Carrega os dados atualizados
        List<Imovel__c> imoveis = [SELECT Id, Status__c FROM Imovel__c WHERE Id = :imovel.Id];
        List<Comissao__c> comissoes = [SELECT Id, Status__c FROM Comissao__c WHERE Id = :comissao.Id];

        //Verifica se os dados foram atualizados
        System.assertEquals('Vendido', imoveis[0].Status__c);
        System.assertEquals('Paga', comissoes[0].Status__c);
    }
}