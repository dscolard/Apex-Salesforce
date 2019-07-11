public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> acctList){
        for(Account acc : acctList){
            //If shipping state is null or doesnt match the billing state then change it to match.
            if(acc.ShippingState == NULL || acc.ShippingState != acc.ShippingState){
                acc.ShippingState = acc.BillingState;
            }
        }
    }
}
