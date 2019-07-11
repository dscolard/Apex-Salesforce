/*
    Queueable Apex allows you to submit jobs for asynchronous processing similar to 
    future methods with the following additional benefits:
-- Non-primitive types: Your Queueable class can contain member variables of non-primitive 
    data types, such as sObjects or custom Apex types. Those objects can be accessed when the job executes.
-- Monitoring: When you submit your job by invoking the System.enqueueJob method, the method returns the ID 
    of the AsyncApexJob record. You can use this ID to identify your job and monitor its progress, either through 
    the Salesforce user interface in the Apex Jobs page, or programmatically by querying your record from AsyncApexJob.
-- Chaining jobs: You can chain one job to another job by starting a second job from a running job. Chaining jobs is 
    useful if you need to do some sequential processing.
*/

public class AddPrimaryContact {
    
    //Initiate global variables
    public Contact c;
    public String state;
    
    //Constructor method
    public addPrimaryContact(Contact con, String state){
		this.c = con;
        this.state = state;
    }
    
    //Execute method
    public void execute(QueueableContext qc){
        system.debug('this.c='+this.c+' this.state='+this.state);
        
        //Retrieve max.200 accounts with matching billingState
        List<Account> lstAccount = new List<Account>([SELECT id, BillingState FROM account 
                         WHERE account.BillingState =: this.state LIMIT 200]);
        
        List<Contact> lstContact = new List<Contact>();
        
        //Add primary contact to each account and place in list
        for(account a : lstAccount){
            contact newCon = new contact();
            newCon = this.c.clone(false,false,false,false);
            newCon.AccountId = a.Id;
            lstContact.add(newCon);
        }
        //Insert list
        insert lstContact;
    }
}
