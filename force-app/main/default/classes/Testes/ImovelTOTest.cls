@isTest
public class ImovelTOTest {

    @isTest
    static void testImovelTO() {

        ImovelTO imovelTO = new ImovelTO();
        
        // Testando o set e o get do campo "id"
        String id = 'abcde1234';
        imovelTO.id = id;
        System.assertEquals(id, imovelTO.id);
        
        // Testando o set e o get do campo "numeroImovel"
        String numeroImovel = '78910';
        imovelTO.numeroImovel = numeroImovel;
        System.assertEquals(numeroImovel, imovelTO.numeroImovel);
        
        // Testando o set e o get do campo "tipoImovel"
        String tipoImovel = 'Casa';
        imovelTO.tipoImovel = tipoImovel;
        System.assertEquals(tipoImovel, imovelTO.tipoImovel);
        
        // Testando o set e o get do campo "nomeCliente"
        String nomeCliente = 'Marimar';
        imovelTO.nomeCliente = nomeCliente;
        System.assertEquals(nomeCliente, imovelTO.nomeCliente);
        
        // Testando o set e o get do campo "valorVenda"
        Decimal valorVenda = 100000.00;
        imovelTO.valorVenda = valorVenda;
        System.assertEquals(valorVenda, imovelTO.valorVenda);
        
        // Testando o set e o get do campo "Vendedor"
        String vendedor = 'Kaito';
        imovelTO.Vendedor = vendedor;
        System.assertEquals(vendedor, imovelTO.Vendedor);
        
        // Testando o set e o get do campo "idCliente"
        String idCliente = '123456789kkbbcc';
        imovelTO.idCliente = idCliente;
        System.assertEquals(idCliente, imovelTO.idCliente);
    }
}