
//Searching the contact and lead objects using SOSL

public class ContactAndLeadSearch {
    
    //Create a 2D array oof lists, in this case a list of contacts and a list of leads.
    public static List<List<SObject>> searchContactsAndLeads(String target){
        
        //Search contact and lead sObjects for first and last names matching the given input.
        List<List<SObject>> searchList = [FIND :target IN ALL FIELDS RETURNING contact(FirstName, LastName), 
                                          lead(FirstName, LastName)];
        return searchList;
    }
}
