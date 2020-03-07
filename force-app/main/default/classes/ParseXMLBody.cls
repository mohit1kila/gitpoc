public class ParseXMLBody {

public String xmlstring{get;set;}
public string SearchString{get;set;}
public string outxmlstring{get;set;}

public string ParseXML(string Searchstr,string xmlString1)
{
    SearchString=Searchstr.trim();
      outxmlstring ='';
      xmlstring=xmlString1.trim();
      system.debug('Searchstr-->'+Searchstr);
       system.debug('xmlString1-->'+xmlstring);
       DOM.Document xmlDOC = new DOM.Document(); 
       xmlDOC.load(xmlstring); 
       DOM.XMLNode rootElement = xmlDOC.getRootElement();
       String result= walkThrough(rootElement );
       
       return outxmlstring;
}

  Public String walkThrough(DOM.XMLNode node) {
        String result = '\n';
        if (node.getNodeType() == DOM.XMLNodeType.COMMENT) {
            return 'Comment (' +  node.getText() + ')';
        }
        if (node.getNodeType() == DOM.XMLNodeType.TEXT) {
            return 'Text (' + node.getText() + ')';
        }
        if (node.getNodeType() == DOM.XMLNodeType.ELEMENT) {
            
            if (node.getText().trim() != '') {
                outxmlstring +=' '+node.getText().trim()+'\n';
                String nName = node.getName();
            /*    if(nName == 'XXX')
                  {
                             String xxx = node.getText().trim();
                   }    */
            }
            if (node.getAttributeCount() > 0) { 
                for (Integer i = 0; i< node.getAttributeCount(); i++ ) {
                  //  result += ', attribute #' + i + ':' + node.getAttributeKeyAt(i) + '=' + node.getAttributeValue(node.getAttributeKeyAt(i), node.getAttributeKeyNsAt(i));
                }  
            }
            for (Dom.XMLNode child: node.getChildElements()) {
                result += walkThrough(child);
            }
            return result;
        }
        return '';
    }
    
}