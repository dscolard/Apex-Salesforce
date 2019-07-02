//Searching the contact object using SOQL

public class ContactSearch {
    public static List<Contact> searchForContacts(String name, String postalCode){
        //Find contacts with LastName and MailingPostalCOde matching the parameters passed in.
        List<Contact> cts = [SELECT Id, Name, LastName, MailingPostalCode FROM Contact WHERE LastName =: name AND MailingPostalCode =: postalCode];
        return cts;
    }
}
