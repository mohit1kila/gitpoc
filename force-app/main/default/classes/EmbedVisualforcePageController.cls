public class EmbedVisualforcePageController {

    public Id recordId { get; set; }
    
    public EmbedVisualforcePageController() {
    
        // get record id from query parameters        
        recordId = ApexPages.currentPage().getParameters().get('id');
        
    }    
    
}