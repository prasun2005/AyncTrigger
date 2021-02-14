trigger AccountChangeEvent on AccountChangeEvent (after insert) 
{
    List<Task> tasks = new List<Task>();
    for(AccountChangeEvent acc : trigger.new) {
        EventBus.ChangeEventHeader header = acc.ChangeEventHeader;
        if (header.changetype == 'UPDATE') { 
//The trigger iterates all Event with changeType field is 'UPDATE'
            
                Task newTask = new Task();
                newTask.Subject='Follow up on Accounts: ' + header.recordIds;
                newTask.OwnerId = header.CommitUser;
                newTask.WhatId = header.recordIds[0];
                tasks.add(newTask);
                //Testing commitssdf

        }
    }
    if(tasks != null && !tasks.isEmpty()) {
        insert tasks; 
//insert the Task with all the isWon Opportunities
    }
}