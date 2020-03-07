public with sharing class OpportunityChangeEventService {
    public OpportunityChangeEventService() {

    }
    public static void fireOpportunityEvent(list<OpportunityChangeEvent> opportunityEvents)
    {
      system.System.debug(opportunityEvents);
    }
}