//Trigger on insert
trigger AccountTrigger on Account (before insert) {
    if(Trigger.isInsert && Trigger.isBefore){
        System.debug(Trigger.new);
		AccountTriggerHandler.CreateAccounts(Trigger.New);
    }  
}
