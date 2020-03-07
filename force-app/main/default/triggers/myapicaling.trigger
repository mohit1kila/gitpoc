trigger myapicaling on Account (after insert,after update) {

    for(account act:trigger.new)
    {
        myapicalingcontroller.callapi(string.valueof(act.id));
    }

}