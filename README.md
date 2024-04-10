# Copilot for Security Tools
This GitHub repo contains info on

[Cost Calculator for Scalable Capacity](https://github.com/KnudsenMorten/Copilot4SecurityTools/tree/main#cost-calculator-for-scalable-deployment-of-capacity)

[Deployment script for Scalable Deployment of Capacity](https://github.com/KnudsenMorten/Copilot4SecurityTools/tree/main#deployment-script-for-scalable-deployment-of-capacity)

[Automation of Capacity Change](https://github.com/KnudsenMorten/Copilot4SecurityTools/tree/main#automation-of-capacity-change)



## Background

Some of my customers are not having 24x7 SOC but still wants to utilize Microsoft Copilot for Security during their normal workhours, typically Monday-Friday from 8am-4pm. 

During this time they want to have a scalable capacity with most capacity in the morning (peak) and then less capacity in the afternoon. When they go home, they want the capacity to be removed until next day at 8am. 

This scenario will decrease the cost for Copilot for Security significantly as it is only running during their workhours.



## Disclaimer about pricing

> Since Microsoft Copilot for Security came out April 1, 2024, I expect some fine-tuning of technical conditions and pricing along the way. Therefore the idea behind this method and price examples may change, if Microsoft introduces changes in price structure or technical conditions in the future.
>
> **I recommend to monitor [this webpage](https://www.microsoft.com/en-us/security/business/ai-machine-learning/microsoft-copilot-security) to check out the latest about Microsoft Copilot for Security.**



## **Cost Calculator for Scalable Deployment of Capacity**

This spreadsheet can be used to calculate the capacity cost for a non-24x7 SOC scenario, where Copilot for Security is used with different sizing during the day (high, medium, low capacity usage) during for example 8am-4pm operation.

[Excel file - Cost Calculator](https://github.com/KnudsenMorten/Copilot4SecurityTools/raw/main/CostCalculator/Microsoft%20Copilot%20for%20Security%20Cost%20Calculator.xlsx )

Example of cost per month, based on peak in the morning with degrade of capacity requirement around noon. Capacity is removed at 4pm, when IT dept goes home. No 24x7 SOC.

![image-20240405183838900](https://github.com/KnudsenMorten/Copilot4SecurityTools/blob/main/img/image-20240405183838900.png)

> **NOTE: This spreadsheet doesn't replace Microsoft Azure Price Calculator. Microsoft Azure Price Calculator contains latest on pricing and conditions for your region and environment.**



## Deployment scripts for Scalable Deployment of Capacity

[Link to ZIP-file with all files](https://github.com/KnudsenMorten/Copilot4SecurityTools/archive/refs/heads/main.zip)

| Purpose                                                      | SCUs (sample) | File                                                        |
| ------------------------------------------------------------ | ------------- | ----------------------------------------------------------- |
| High  - Gives highest amount of SCUs.   <br />Typically used in the morning for example from 8-10am, when  security incidents are being analyzed (peak) | 4             | DeploymentCopilot4Security  <br />Capacity_SCU_High_Usage   |
| Medium - Gives medium amount of SCUs. <br />Typically used in the morning after initial security incident analysis for example from 10-11am | 2             | DeploymentCopilot4Security  <br />Capacity_SCU_Medium_Usage |
| Low - Gives lowest amount of SCUs. <br />Typically used when peak for security analyses are over and normal security operation happens for example from 11am-4pm | 1             | DeploymentCopilot4Security <br />Capacity_SCU_Low_Usage     |
| Delete - Removes capacity, so there will be no capacity cost in off-hours where IT dept. works. Used in scenarios with no 24x7 Security SOC. This can run for example at 4pm when IT dept goes home. | 0             | DeleteCopilotf4SecurityCapacity                             |

NOTE: Remember to edit the amounts of SCUs and region in the files for your needs

![image-20240405185205986](https://github.com/KnudsenMorten/Copilot4SecurityTools/blob/main/img/image-20240405185205986.png)



## Automation of Capacity Change

You can automate the configuration using any method like Scheduled Tasks software like Task Scheduler, VisualCron - or Azure Function, Azure DevOps or LogicApps. Aaron Hoffman made a great article on how to to this in LogicApp [here](https://medium.com/@aaron.hoffmann/scheduling-microsoft-copilot-for-security-capacities-20f4b26f1999)

Below is an example of doing this as 4 jobs using VisualCron (Advanced Task Scheduler)

![image-20240405184741166](https://github.com/KnudsenMorten/Copilot4SecurityTools/blob/main/img/image-20240405184741166.png)

