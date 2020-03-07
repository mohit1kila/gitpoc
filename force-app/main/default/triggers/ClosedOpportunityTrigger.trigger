trigger ClosedOpportunityTrigger  on Opportunity (after insert,after update) 
{
list<task> lstTaks=new list<task>();
for(Opportunity  varOppty: trigger.new)
{
    if(varOppty.StageName =='Closed Won')
    {
    task objtask=new task();
    objtask.subject='Follow Up Test Task';
    objtask.whatid=varOppty.id;
    lstTaks.add(objtask);
    }
}
if(lstTaks.size()>0)
{insert lstTaks;}


}