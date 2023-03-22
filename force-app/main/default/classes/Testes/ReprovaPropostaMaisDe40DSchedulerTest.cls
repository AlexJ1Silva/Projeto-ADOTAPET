@isTest
public class ReprovaPropostaMaisDe40DSchedulerTest {
    @isTest
    static void testAgendamento() {
        Test.startTest();
        ReprovaPropostaMaisDe40DStsAgPgScheduler.agendar();
        Test.stopTest();
        List<CronTrigger> jobs = [SELECT Id, CronJobDetail.Name, State FROM CronTrigger WHERE CronJobDetail.Name = :ReprovaPropostaMaisDe40DStsAgPgScheduler.nome];
        System.assertEquals(1, jobs.size(), 'Deve haver apenas um job agendado');
        System.assertEquals('WAITING', jobs[0].State, 'O job deve estar esperando para ser executado');
    }
}