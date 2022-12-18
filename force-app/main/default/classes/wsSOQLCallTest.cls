@isTest
public class wsSOQLCallTest {
    @isTest static void Test_wsSOQLCallTest() {
        String result1, result2;
        Test.startTest();
        result1 = wsSoqlCall.getAggregateValue('SELECT COUNT(Id) From User');
        result2 = wsSoqlCall.getAggregateValue('SELECT Id From Account');
        Test.stopTest();

        System.assertNotEquals('', result1);
        System.assertEquals(null, result2);
    }

    @isTest static void Test_wsSOQLCallTest2() {
        List<sObject> result1;
        sObject result2;
        List<Double> result3;
        Test.startTest();
        result1 = wsSoqlCall.getObjects('SELECT Id From Account');
        result2 = wsSoqlCall.getObject('SELECT Id From Account');
        result1 = wsSoqlCallAdmin.getObjects('SELECT Id From Account');
        List<wsSOQLCall.flowInputs> listOftests = new List<wsSOQLCall.flowInputs>();
        wsSOQLCall.flowInputs input = new wsSOQLCall.flowInputs();
        input.FieldToGroupBy = 'Total_lignes_factures_HT__c';
        input.ObjectApiName = 'Facture__c';
        input.WhereClause = 'CreatedDate = TODAY';
        listOftests.add(input);
        result3 = wsSoqlCall.groupBy(listOftests);
        Test.stopTest();

        System.assertEquals(true, result1.isEmpty());
    }
}