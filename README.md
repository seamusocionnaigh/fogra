# Fógra

fógra, m. (gs. ~, pl. ~í).
1 = FÓGAIRT. 2. Notice. (a)~ a thabhairt (go), to give notice (that).

### Alerts for CRM Analytics Dataflow and Recipe Failures

Use [scheduled Apex](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_interface_system_schedulable.htm) to query the CRM Analytics [dataflow job resources](https://developer.salesforce.com/docs/atlas.en-us.bi_dev_guide_rest.meta/bi_dev_guide_rest/bi_resources_dataflowjobs.htm) REST resource, and create a [platform event](https://developer.salesforce.com/docs/atlas.en-us.platform_events.meta/platform_events/platform_events_intro.htm). 

### Analytics on Dataflow and Recipe run times

Analytics about analytics! Stores the data retrieved from the dataflow job resources so you can track performance over time.

### Simple instructions

- Assign the Dataflow Job History Admin permission set
- Execute [anonymous apex](https://help.salesforce.com/s/articleView?id=sf.code_dev_console_execute_anonymous.htm&type=5), for example, to schedule the monitor to run every 30 minutes:
```
String schedule = '0 30 * * * ?';//every 30 mins
System.Schedule('PatchReplicatedDataset',schedule,new AnalyticsMonitor());
```
- Navigate to the Dataflow Job History folder under the Dashboards tab
- Review the Dataflow Job Failure object under Setup - Integration - Platform Events
- Decide whether to [use Apex](https://trailhead.salesforce.com/content/learn/modules/platform_events_basics/platform_events_subscribe) or [Flows](https://developer.salesforce.com/docs/atlas.en-us.platform_events.meta/platform_events/platform_events_subscribe_flow.htm) to create cases, send multiple e-mails, or in-app notifications to alert multiple stakeholders about failed jobs.

### TODO

- Less lazy query of dataflowjobs
-- filter on job created or or executed date and compare against last known schedule query
- better handling of the Message property
-- some messages are closer to warnings i.e. the job failed because it's already in the queue
-- if the message contains 'Error Id', 'Internal Server Error' or 'Java', recommend a Salesforce support case is logged
- managed package for better admin support

### Preview

![image](https://user-images.githubusercontent.com/20658634/222834327-986c85df-dad2-4404-a9a4-6ad0086516f8.png)
