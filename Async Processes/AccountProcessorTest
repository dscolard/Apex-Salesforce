@isTest
public class AccountProcessorTest {   
    public static testMethod void TetsAccountProcessorTest(){
        
        //Create Account
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;
        
        //Create contact
        Contact con = new Contact();
        con.FirstName = 'Bob';
        con.LastName = 'Marley';
        con.AccountId = a.Id;
        insert con;
        
        //Create set to pass in as parameter
        set<id> setAccId = new Set<Id>();
        setAccId.add(a.id);
        
        //Execute method
        Test.startTest();
        	AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        
        //Check result
        Account acc = [select Number_of_Contacts__c from Account where id =: a.id LIMIT 1];
        System.assertEquals ( Integer.valueOf(acc.Number_of_Contacts__c) ,1);
       
    }
}
