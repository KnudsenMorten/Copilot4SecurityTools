# Copilot for Security Tools
Cost Calculator for Scalable Capacity and Deployment scripts



## **Cost Calculator for Scalable Deployment of Capacity**

[Link]: https://github.com/KnudsenMorten/Copilot4SecurityTools/blob/main/CostCalculator/Microsoft%20Copilot%20for%20Security%20Cost%20Calculator.xlsx



![image-20240405183838900](https://github.com/KnudsenMorten/Copilot4SecurityTools/blob/main/img/image-20240405183838900.png)



## Deployment script for Scalable Deployment of Capacity

[Link]: https://github.com/KnudsenMorten/Copilot4SecurityTools/tree/main/ScalableDeployment

You can manually edit the amounts of SCUs and region in the files for your needs

![image-20240405185205986](https://github.com/KnudsenMorten/Copilot4SecurityTools/blob/main/img/image-20240405185205986.png)



| File                                                    | Purpose                                                      | SCUs (sample) |
| ------------------------------------------------------- | ------------------------------------------------------------ | ------------- |
| DeploymentCopilot4SecurityCapacity_SCU_High_Usage.ps1   | Gives highest amount of SCUs. Typically used in the morning for example from 8-10am, when  security incidents are being analyzed (peak) | 4             |
| DeploymentCopilot4SecurityCapacity_SCU_Medium_Usage.ps1 | Gives medium amount of SCUs. Typically used in the morning after initial security incident analysis for example from 10-11am | 2             |
| DeploymentCopilot4SecurityCapacity_SCU_Low_Usage.ps1    | Gives lowest amount of SCUs. Typically used when peak for security analyses are over and normal security operation happens for example from 11am-4pm | 1             |
| DeleteCopilotf4SecurityCapacity.ps1                     | Removes capacity, so there will be no capacity cost in off-hours where IT dept. works. Used in scenarios with no 24x7 Security SOC. This can run for example at 4pm when IT dept goes home. | 0             |



## Automation of Capacity Change

You can automate the configuration using any method like Scheduled Tasks software like Task Scheduler, VisualCron; Azure Function; LogicApps, etc.

![image-20240405184741166](https://github.com/KnudsenMorten/Copilot4SecurityTools/blob/main/img/image-20240405184741166.png)

