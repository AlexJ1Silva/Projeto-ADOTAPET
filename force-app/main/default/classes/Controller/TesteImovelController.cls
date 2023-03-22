@isTest
public class TesteImovelController {
    
    @testSetup static void prepararDados() {
        // Crie dados de teste, como PropostaCompra__c, Imovel__c, Contact__c, etc.
        // Certifique-se de criar pelo menos 5 PropostaCompra__c com Status__c = 'Finalizada'
        List<Imovel__c> lstImovel = new List<Imovel__c>();
          for(integer i = 0; i <5; i++){
            Imovel__c im = new Imovel__c();
            im.Status__c = 'Vendido';
              im.ValorBase__c = 350000;
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
       
        List<PropostaCompra__c> listProposta = new List<PropostaCompra__c>();
        for(integer i = 0; i <5; i++){
            PropostaCompra__c p = new PropostaCompra__c();
            p.Status__c = 'Finalizada';
            p.Contact__c = listaC[i].id;
            p.Imovel__c = lstImovel[i].id;
            p.Valor__c = 350000;
            
            listProposta.add(p);
        }
        
        insert listProposta;
        
 }
    
    @isTest static void testarUltimas5VendasImovel() {
        // Chame o método que deseja testar
        List<ImovelTO> lstImovelTO = ImovelController.ultimas5VendasImovel();
        
        // Verifique se a lista retornada tem exatamente 5 elementos
        System.assertEquals(5, lstImovelTO.size());
        
        // Verifique se cada elemento da lista tem todos os campos esperados preenchidos
        for (ImovelTO to : lstImovelTO) {
            System.assertNotEquals(null, to.id);
            System.assertNotEquals(null, to.numeroImovel);
            System.assertNotEquals(null, to.tipoImovel);
            System.assertNotEquals(null, to.nomeCliente);
            System.assertNotEquals(null, to.idCliente);
            System.assertNotEquals(null, to.valorVenda);
            //System.assertNotEquals(null, to.vendedor);
        }
    }
}