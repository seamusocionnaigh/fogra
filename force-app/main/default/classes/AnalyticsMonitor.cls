public class AnalyticsMonitor implements Schedulable{

    //String schedule = '0 30 * * * ?';//every 30 mins
    //System.Schedule('FetchDataflowJobDetails',schedule,new AnalyticsMonitor());

    public static void execute(SchedulableContext SC){
        AnalyticsMonitor.getJobs();
    }

    @future(callout=true)
    public static void getJobs(){
        
		String restApi = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v57.0/wave/dataflowjobs';
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setMethod('GET');
        httpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        httpRequest.setHeader('Content-Type', 'application/json; charset=UTF-8');
        httpRequest.setHeader('Accept', 'application/json');
        httpRequest.setEndpoint(restApi);
        
        
        DataflowJobList jobs = new DataflowJobList();

        try {  
			Http http = new Http();   
            HttpResponse httpResponse = http.send(httpRequest);
            jobs = (DataflowJobList)System.JSON.deserialize(httpResponse.getBody(), DataflowJobList.class);
            AnalyticsMonitor.processJobs(jobs);
        } catch( System.Exception e) {
            System.debug(LoggingLevel.ERROR, 'ERROR: '+ e);
            throw e;
        }
    }

    public static void processJobs(DataflowJobList jobs){
        List<DataflowJobHistory__c> dfJobHistList = new List<DataflowJobHistory__c>();
        List<Dataflow_Job_Failure__e> dfJobFailure = new List<Dataflow_Job_Failure__e>();
        for (DataflowJobList.DataflowJob dfj :jobs.dataflowJobs){
            if(dfj.status == 'Failure' || dfj.status == 'Success' || dfj.status == 'Warning'){
                dfJobHistList.add(new DataflowJobHistory__c(
                    Id__c = dfj.id,
                    createdDate__c = dfj.createdDate,
                    duration__c = dfj.Duration,
                    EndDate__c = dfj.endDate,
                    ExecutedDate__c = dfj.executedDate,
                    Label__c = dfj.label,
                    Message__c = dfj.message,
                    NextRunDate__c = dfj.nextRunDate,
                    Progress__c = dfj.progress,
                    RetryCount__c = dfj.retryCount,
                    StartDate__c = dfj.startDate,
                    Status__c = dfj.status,
                    Type__c = dfj.type,
                    WaitTime__c = dfj.waitTime,
                    JobType__c = dfj.jobType
                ));
                //klaxon
                if (dfj.status=='Failure'){
                    dfJobFailure.add(new Dataflow_Job_Failure__e(
                        createdDate__c = dfj.createdDate,
                        duration__c = dfj.Duration,
                        EndDate__c = dfj.endDate,
                        ExecutedDate__c = dfj.executedDate,
                        Label__c = dfj.label,
                        Message__c = dfj.message,
                        NextRunDate__c = dfj.nextRunDate,
                        Progress__c = dfj.progress,
                        Retry_Count__c = dfj.retryCount,
                        StartDate__c = dfj.startDate,
                        Status__c = dfj.status,
                        Type__c = dfj.type,
                        Wait_Time__c = dfj.waitTime
                    ));
                }
            }
        }

        //save history
        List<Database.UpsertResult>  dbsr;
        try {
            dbsr = Database.upsert(dfJobHistList,DataflowJobHistory__c.Id__c,false);
        } catch (System.DMLException e){
            for (Database.UpsertResult sr : dbsr) {
                    for(Database.Error err : sr.getErrors()) {
                        //logging needed
                    }
            }
            throw e;
        }

        //publish failures
        List<Database.SaveResult>  edbsr;
        try {
            edbsr = EventBus.publish(dfJobFailure);
        } catch (System.DMLException e){
            for (Database.SaveResult sr : edbsr) {
                    for(Database.Error err : sr.getErrors()) {
                        //logging needed
                    }
            }
            throw e;
        }
            
    }

    public static void restartJob(){

    }
}
