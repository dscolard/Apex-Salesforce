public class AccountProcessor {
    
/*
    Future Apex is used to run processes in a separate thread, 
    at a later time when system resources become available.

    Before running be sure to create the Number_of_Contacts 
    field on the account object.
*/
    
    @future
    //Update number of contacts for each Account object.
    public static void countContacts(Set<ID> identityList){
        List<Account> lstAccount = [SELECT id, Number_of_Contacts__c, (select id from contacts) 
                                    FROM Account WHERE id IN :identityList];
        //Iterate through Accounts
        for(Account acc : lstAccount){
            //Add all related contacts to a list
            List<Contact> lstCont = acc.contacts;
            //Get Number of contacts
            acc.Number_of_Contacts__c = lstCont.size();
        }
        //DML Statement Update
        update lstAccount;

    }
}
