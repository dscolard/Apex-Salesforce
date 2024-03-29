public class NewCaseListController {
    private String sortOrder = 'Status';
    public integer newSt, workSt, escSt;
    public List<Case> csList;

    public List<Case> getNewCases(){
        String hi = 'high';
        String med = 'medium';
        String cl = 'closed';
        
        //Retrieve cases with a high or medium priority whihc have not been closed.
        List<Case> result = Database.query(
            'SELECT Id, CaseNumber, priority, status, Account.Name '+
            'FROM Case ' +
            'WHERE (priority=:hi OR priority=:med) AND status!=:cl ' + 
            'ORDER BY ' + sortOrder + ' ASC'
        );
        csList=result;
        return result;
    }
    
    public void checkStatus(){
        newSt=0; escSt=0; workSt=0;
        for(Case cs : csList ){
            if(cs.status=='new'){
                newSt++;
            }
            else if(cs.Status=='escalated'){
                escSt++;
            }
            else{
                workSt++;
            }
        }    
    }
    
    public List<PieWedgeData> getPieData() {
        checkStatus();
        List<PieWedgeData> data = new List<PieWedgeData>();
        
        data.add(new PieWedgeData('New', newSt));
        data.add(new PieWedgeData('Working', workSt));
        data.add(new PieWedgeData('Escalated', escSt));

        return data;
    }

    // Wrapper class
    public class PieWedgeData {
        public String name { get; set; }
        public Integer data { get; set; }

        public PieWedgeData(String name, Integer data) {
            this.name = name;
            this.data = data;
        }
    }
}
