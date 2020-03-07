public with sharing class casectrl {
public casecomment objcasecomment{get;set;}
public string strcasecomment{get;set;}
    public casectrl(ApexPages.StandardController controller) {
case objcase=(Case)controller.getRecord();
objcasecomment=[select id, CommentBody ,ParentId from casecomment where ParentId=:objcase.id];
strcasecomment=lineBreaks(objcasecomment.CommentBody );
    }
private string lineBreaks(string inText)
{
system.debug('######'+inText);
   if (inText == null)
   {
       return '';
       }
   else{
   
  // string aaa=inText.replaceAll('<','(').replaceAll('>',')').replaceAll('\n','<br/>');
  string aaa=inText.replaceAll('\n','<br/>');
   system.debug('########'+aaa);
       return aaa;
       }
}
}