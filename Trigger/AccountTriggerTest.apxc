@isTest
public class AccountTriggerTest {
static testMethod void test(){
        
       	//Create 200 accounts with BillingState = CA
        List<Account> newAccounts = new List<Account>();
        for(integer i=0; i<200; i++){
            Account acct = new Account(Name='Test Account'+i, BillingState='CA');
            newAccounts.add(acct);
        }
        
        //Insert accounts which should trigger AccountTrigger
        Test.startTest();
        insert newAccounts;
        Test.stopTest();
        
        //Test for success
        List<Account> updatedAccounts = [SELECT Name, ShippingState FROM Account WHERE BillingState='CA'];
        for(Account acc : updatedAccounts){
            System.assertEquals('CA', acc.ShippingState, 'Error: States do not match');
        }
    
    }
}
