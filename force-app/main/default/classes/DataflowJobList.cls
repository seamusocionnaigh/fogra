public class DataflowJobList {

    public List<DataflowJob> dataflowJobs;

    public DataflowJobList(){
        dataflowJobs = new List<DataflowJob>();
    }
    
    public class DataflowJob{
         
        public String id;	//0eP6R000000YS5TUAW
        public String jobType;	//recipe_v3
        public String label;	//RecordShareSimulation_recipe
        public Decimal progress;	//0.333
        public DateTime createdDate;	//2023-03-01T13:41:55.000Z
        public DateTime startDate;	//2023-03-01T13:41:55.000Z
        public DateTime executedDate;	//2023-03-01T13:41:55.000Z
        public DateTime endDate;	//2023-03-01T13:41:55.000Z
        public DateTime nextRunDate; //2023-03-01T13:41:55.000Z
        public String status;	//Queued, Failure
        public String message; //"scheduled run failed The dataflow job can’t start because it&#39;s already in the queue."  // 
        public String type;	//dataflowjob
        public Integer waitTime;	//20
        public Decimal Duration;   
        public Integer retryCount;
        
        public DataflowJob(){
            
        }
    
    }

}