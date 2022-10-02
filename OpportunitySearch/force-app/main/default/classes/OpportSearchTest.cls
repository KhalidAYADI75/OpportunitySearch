@isTest
public class OpportSearchTest {
    @testSetup static void setup() {
        Account testAcct=new Account();
        testAcct.Name='testAcct';
        insert testAcct;
        Id accountId=testAcct.Id;
        List<Opportunity> opportunityList=new List<Opportunity>(); 
        for (integer i=0;i<=2;i++) {
            Opportunity opp = new Opportunity(); 
            opp.Name='opportunity'+i;
            opp.AccountId=accountId;
            opp.CloseDate=date.parse('13/10/2022');
            opp.StageName='Prospecting';
            opportunityList.add(opp);  
        }
        insert opportunityList;
    }
    @isTest
    static void opportunitySearchWithAccountIdTest() {
        Account acc=[SELECT Id FROM Account WHERE Name='testAcct'];
        Id accountId=acc.Id;
        List<Opportunity> opportList=OpportSearch.opportunitySearch('',accountId);
        System.assertEquals(3,opportList.size());
    }
    @isTest 
    static void opportunitySearchWithNameLikeAndAccountIdTest() {
         Account acc=[SELECT Id FROM Account WHERE Name='testAcct'];
        Id accountId=acc.Id;
        List<Opportunity> opportList=OpportSearch.opportunitySearch('opp',accountId);
        System.assertEquals(3,opportList.size());
    }
    
}