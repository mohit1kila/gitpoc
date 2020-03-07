public class aa 
{


@AuraEnabled
public static List<Contact> getContacts() {
    return [Select Id, Name, Email, Title, Phone From Contact];
}
public string str{get;set;}

public List<SelectOption> lst2{get;set;}
public aa()
{lst2=new list<SelectOption>();
str='';
string str='00';
string str1='bbM';
}
public List<SelectOption> getItems() 
{
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('US','US'));
            options.add(new SelectOption('CANADA','Canada'));
            options.add(new SelectOption('MEXICO','Mexico'));
            return options;
        }
            
       

public pagereference redir()
{

list<string> lstselectedOptions=new list<string>();
system.debug('----lst2------->'+str);
for(SelectOption varOptions: lst2)
{
lstselectedOptions.add(varOptions.getvalue());

}
system.debug('----------->'+lstselectedOptions);

    //return editList;
    return null;
}

}