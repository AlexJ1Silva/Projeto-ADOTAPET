public with sharing class CertificadoPdfController {
    public String cidade {get; set;} 
    public String dia {get; set;}
    public String mes {get; set;}
    public String ano {get; set;} 
    public String recordId {get; set;} 
    public Pet__c pet {get; set;}
    public String dataUltimaVacina {get;set;}
    public String dataProximaVacina {get;set;}

  public CertificadoPdfController() {

      Map<String, String> mapParamUrl = ApexPages.currentPage().getParameters();
      if(mapParamUrl.containsKey('rId')) {
        System.debug('############>>>>'+mapParamUrl);
          this.recordId = mapParamUrl.get('rId');
      }

      this.dia = System.now().day().format();
      this.mes = traduzirMeses(System.now().format('MMMM'));
      this.ano = System.now().year().format().replace('.', '');
      this.cidade = 'Itajaí';
      this.pet = PetDAO.getPet(this.recordId); 
      Datetime dtUlt = Date.ValueOf(this.pet.DataUltimaVacinacao__c);
      Datetime dtProx = Date.ValueOf(this.pet.DataProximaVacinacao__c);
      this.dataUltimaVacina = dtUlt.formatGMT('dd/MM/YYYY');
      this.dataProximaVacina = dtProx.formatGMT('dd/MM/YYYY');


  }

  public static String traduzirMeses(String month){
      switch on month {
          when 'January' {
              return 'Janeiro';
          } when 'February' {
              return 'Fevereiro';
          } when 'March' {
              return 'Março';
          } when 'April' {
              return 'Abril';
          } when 'May' {
              return 'Maio';
          } when 'June' {
              return 'Junho';
          } when 'July' {
              return 'Julho';
          } when 'August' {
              return 'Agosto';
          } when 'September' {
              return 'Setembro';
          } when 'October' {
              return 'Outubro';
          } when 'November' {
              return 'Novembro';
          } when 'December' {
              return 'Dezembro';
          } when else {
              return null;
          }
      }
  }
}
