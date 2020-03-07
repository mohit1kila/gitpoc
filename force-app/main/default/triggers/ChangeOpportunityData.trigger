trigger ChangeOpportunityData on OpportunityChangeEvent (after insert) {
//Opportunity Change Event
OpportunityChangeEventService.fireOpportunityEvent(trigger.new);

}