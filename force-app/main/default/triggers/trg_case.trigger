trigger trg_case on Case (before insert, before update) {

account act=[select id from account where name= 'acc_admin'];
for(case cs: trigger.new)
{
if(trigger.Isinsert)
{
system.debug('@@@@@@1'+cs.accountid+ trigger.oldmap);
}else
{
system.debug('@@@@@@'+cs.accountid+ trigger.oldmap);
}
cs.accountid= act.id;
cs.subject=cs.subject+'new test';
}
}