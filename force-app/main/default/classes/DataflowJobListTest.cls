@isTest
public class DataflowJobListTest {

    @isTest
    static void testDataflowJobList() {
        
        // Create a new DataflowJobList object
        DataflowJobList jobList = new DataflowJobList();
        
        // Create a new DataflowJob object
        DataflowJobList.DataflowJob job = new DataflowJobList.DataflowJob();
        job.id = '0eP6R000000YS5TUAW';
        job.jobType = 'recipe_v3';
        job.label = 'RecordShareSimulation_recipe';
        job.progress = 0.333;
        job.createdDate = DateTime.newInstance(2023, 3, 1, 13, 41, 55);
        job.startDate = DateTime.newInstance(2023, 3, 1, 13, 41, 55);
        job.executedDate = DateTime.newInstance(2023, 3, 1, 13, 41, 55);
        job.endDate = DateTime.newInstance(2023, 3, 1, 13, 41, 55);
        job.nextRunDate = DateTime.newInstance(2023, 3, 1, 13, 41, 55);
        job.status = 'Queued';
        job.message = 'scheduled run failed The dataflow job can’t start because it&#39;s already in the queue.';
        job.type = 'dataflowjob';
        job.waitTime = 20;
        job.Duration = 100.0;
        job.retryCount = 1;
        
        // Add the DataflowJob object to the DataflowJobList object
        jobList.dataflowJobs.add(job);
        
        // Test that the DataflowJob object was added to the DataflowJobList object
        System.assertEquals(1, jobList.dataflowJobs.size());
        System.assertEquals('0eP6R000000YS5TUAW', jobList.dataflowJobs[0].id);
    }
}
