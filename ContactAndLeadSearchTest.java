@isTest
public class ContactAndLeadSearchTest {
    
    static testMethod void test(){
        
        //Create Account
        Account acct = new Account(
            Name = 'Smith Enterprise',
            Phone = '(+353)838908736',
            BillingCity = 'Dublin'
        );
        insert acct;
   
        //Create Contact
        Contact newContact = new Contact(
       		FirstName = 'Bob',
        	LastName = 'Smith',
            Phone = '(+353)874376381',
            Department = 'Socks',
            AccountId = acct.ID
        );
        insert newContact;
        
        //Create Lead
        Lead newLead = new Lead(
        	FirstName = 'Lisa',
        	LastName = 'Smith',
        	Company = 'Widget Corp'
        );
        insert newLead;
 
        //Call search method
        List<List<sObject>> result = ContactAndLeadSearch.searchContactsAndLeads('Smith');
    }
}
