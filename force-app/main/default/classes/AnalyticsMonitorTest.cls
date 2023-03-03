@isTest
public class AnalyticsMonitorTest{

    @isTest
    static void testGetJobs() {
        Test.startTest();
        
        Test.setMock(HttpCalloutMock.class, new AnalyticsMonitorMockHTTPClass());

        AnalyticsMonitor.getJobs();
        
        Test.stopTest();
    }
    
    @isTest
    static void testProcessJobs() {

        String response = '{  "dataflowJobs" : [ {"createdDate" : "2023-03-01T13:41:40.000Z","duration" : 137,"endDate" : "2023-03-01T13:54:53.000Z","executedDate" : "2023-03-01T13:52:36.000Z","id" : "0eP6R000000YS5EUAW","jobType" : "recipe_v3","label" : "Test Job","licenseAttributes" : {  "type" : "einsteinanalytics"},"message" : "DataflowInstance 03C6R0000032esnUAA cancelled. Hmm, that didn&#39;t work. Please try running the recipe again. Error ID: 2000-2444fcfe-0eP6R000000YS5E. If the error occurs again, contact Salesforce Customer Support.","nodesUrl" : "/services/data/v57.0/wave/dataflowjobs/0eP6R000000YS5EUAW/nodes","progress" : 0.3333333333333333,"retryCount" : 2,"startDate" : "2023-03-01T13:41:40.000Z","status" : "Failure","syncDataflows" : {  "dataflows" : [ ]},"type" : "dataflowjob","url" : "/services/data/v57.0/wave/dataflowjobs/0eP6R000000YS5EUAW","waitTime" : 656  }, {"createdDate" : "2023-03-03T00:00:03.000Z","duration" : 17,"executedDate" : "2023-03-03T00:00:06.000Z","id" : "03C6R0000032f7OUAQ","jobType" : "recipe","label" : "Test Job","nodesUrl" : "/services/data/v57.0/wave/dataflowjobs/03C6R0000032f7OUAQ/nodes","progress" : 1.0,"retryCount" : 0,"startDate" : "2023-03-03T00:00:03.000Z","status" : "Success","syncDataflows" : {  "dataflows" : [ ]},"type" : "dataflowjob","url" : "/services/data/v57.0/wave/dataflowjobs/03C6R0000032f7OUAQ","waitTime" : 3  } ]}    ';
        DataflowJobList jobs = new DataflowJobList();
        jobs = (DataflowJobList)System.JSON.deserialize(response, DataflowJobList.class);
        
        Test.startTest();        
        AnalyticsMonitor.processJobs(jobs);
        Test.stopTest();

        List<DataflowJobHistory__c> expectedHistory = new List<DataflowJobHistory__c>();
        expectedHistory.add(new DataflowJobHistory__c(
            Id__c = 'jobId',
            createdDate__c = DateTime.now(),
            duration__c = 0,
            EndDate__c = DateTime.now(),
            ExecutedDate__c = DateTime.now(),
            Label__c = 'Test Job',
            Message__c = 'Test Message',
            NextRunDate__c = DateTime.now(),
            Progress__c = 0,
            RetryCount__c = 0,
            StartDate__c = DateTime.now(),
            Status__c = 'Success',
            Type__c = 'Test Type',
            WaitTime__c = 0,
            JobType__c = 'Test Job Type'
        ));
        expectedHistory.add(new DataflowJobHistory__c(
            Id__c = 'jobId',
            createdDate__c = DateTime.now(),
            duration__c = 0,
            EndDate__c = DateTime.now(),
            ExecutedDate__c = DateTime.now(),
            Label__c = 'Test Job',
            Message__c = 'Test Message',
            NextRunDate__c = DateTime.now(),
            Progress__c = 0,
            RetryCount__c = 0,
            StartDate__c = DateTime.now(),
            Status__c = 'Failure',
            Type__c = 'Test Type',
            WaitTime__c = 0,
            JobType__c = 'Test Job Type'
        ));

        List<DataflowJobHistory__c> actualHistory = [SELECT Id__c, Label__c FROM DataflowJobHistory__c];
        System.assertEquals(expectedHistory.size(), actualHistory.size());
        System.assertEquals(expectedHistory[0].Label__c, actualHistory[0].Label__c);
        
    }
}