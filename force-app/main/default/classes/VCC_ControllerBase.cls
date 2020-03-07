/*
    Author          : Accenture Team 
    Date Created    : 10/05/2011
    Description     : The Base Class for Visualforce Component Controller to facilitate the communication between 
                      Visualforce Page Controller and Component Controller. The visualforce component controller(s) 
                      that want to communicate with the controller of the visualforce page,
                      need to extend this class.  
*/
public virtual class VCC_ControllerBase 
{
    //getter and setter method to set the key of the Component Map
    public String key
    {   
        get;
        set{
            if(value != null)
            {
                Key = value;
                if(pageController != null){
                        pageController.setComponentControllerMap(Key, this);
                    }
            }
        }
    }
   
    //getter and setter method to set the Page Controller
    public VFC_ControllerBase pageController
    { 
        get;
        set {
            if (value != null) 
            {
                pageController = value;
                if (Key != null )
                   { pageController.setComponentControllerMap(Key, this);
                   }
            }     
        }
    }
}