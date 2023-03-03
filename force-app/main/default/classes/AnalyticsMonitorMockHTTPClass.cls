@isTest
global class AnalyticsMonitorMockHTTPClass implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
       
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{  "dataflowJobs" : [ {"createdDate" : "2023-03-01T13:41:40.000Z","duration" : 137,"endDate" : "2023-03-01T13:54:53.000Z","executedDate" : "2023-03-01T13:52:36.000Z","id" : "0eP6R000000YS5EUAW","jobType" : "recipe_v3","label" : "Test Job","licenseAttributes" : {  "type" : "einsteinanalytics"},"message" : "DataflowInstance 03C6R0000032esnUAA cancelled. Hmm, that didn&#39;t work. Please try running the recipe again. Error ID: 2000-2444fcfe-0eP6R000000YS5E. If the error occurs again, contact Salesforce Customer Support.","nodesUrl" : "/services/data/v57.0/wave/dataflowjobs/0eP6R000000YS5EUAW/nodes","progress" : 0.3333333333333333,"retryCount" : 2,"startDate" : "2023-03-01T13:41:40.000Z","status" : "Failure","syncDataflows" : {  "dataflows" : [ ]},"type" : "dataflowjob","url" : "/services/data/v57.0/wave/dataflowjobs/0eP6R000000YS5EUAW","waitTime" : 656  }, {"createdDate" : "2023-03-03T00:00:03.000Z","duration" : 17,"executedDate" : "2023-03-03T00:00:06.000Z","id" : "03C6R0000032f7OUAQ","jobType" : "recipe","label" : "Test Job","nodesUrl" : "/services/data/v57.0/wave/dataflowjobs/03C6R0000032f7OUAQ/nodes","progress" : 1.0,"retryCount" : 0,"startDate" : "2023-03-03T00:00:03.000Z","status" : "Success","syncDataflows" : {  "dataflows" : [ ]},"type" : "dataflowjob","url" : "/services/data/v57.0/wave/dataflowjobs/03C6R0000032f7OUAQ","waitTime" : 3  } ]}  ');
        res.setStatusCode(200);
        return res;
    }
}