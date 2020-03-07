public class MyController {

public String strurl{
get;set;
}

public MyController() {
strurl =  ApexPages.currentPage().getParameters().get('url');
} 
}