@IsTest
private class ComprovanteComissaoControllerTest {

    @IsTest
    static void testTraduzirMeses() {
        String ress = ComprovanteComissaoController.traduzirMeses('January');
        System.assertEquals('Janeiro', ress);

        ress = ComprovanteComissaoController.traduzirMeses('June');
        System.assertEquals('Junho', ress);

        ress = ComprovanteComissaoController.traduzirMeses('InvalidMonth');
        System.assertEquals(null, ress);
    }

    @IsTest
    static void testComprovanteComissaoController() {
        
        Imovel__c i = new Imovel__c(Status__c='Vendido');
        
        insert i;
        
        Contact c = new Contact(LastName='TestContato');
        insert c;
       
        PropostaCompra__c pc = new PropostaCompra__c(Imovel__c=i.id, Contact__c=c.id);
        insert pc;

        // Configure o parâmetro URL para simular a página atual
        ApexPages.currentPage().getParameters().put('rId', pc.Id);

        // Crie uma instância de ComprovanteComissaoController
        ComprovanteComissaoController controller = new ComprovanteComissaoController();

        // Verifique se a instância foi criada corretamente
        //System.assertEquals('Itajaí', controller.cidade);
        //System.assertEquals(String.valueOf(System.now().day()), controller.dia);
        //System.assertEquals(ComprovanteComissaoController.traduzirMeses(System.now().format('MMMM')), controller.mes);
        //System.assertEquals(String.valueOf(System.now().year()).replace('.', ''), controller.ano);
       //System.assertEquals(pc.Id, controller.recordId);
        //System.assertEquals(pc, controller.pc);
    }
}