public class EditAndCloseController {

    public Boolean isvisible { get; set; }

  public PageReference edittest()
{
isvisible =true;
return null;
}

Public PageReference closeeinput()
{

isvisible =false;
return null;
}
}