Environment Setup:
ENV TFC_AGENT_TOKEN=$TFC_AGENT_TOKEN
ENV TFC_AGENT_NAME=$TFC_AGENT_NAME

just  build the image like: 
docker build -t your-image-name --build-arg TFC_AGENT_TOKEN=your_token --build-arg TFC_AGENT_NAME=your_name .

The provided information describes a PowerShell script named Az.ps1 that simplifies Azure resource management tasks. Here's a breakdown of its functionalities:
 * Environment Setup: Sets up the environment to interact with Azure resources using Azure CLI and PowerShell.
 * Azure Subscription Management: Allows easy login and selection of the desired Azure subscription.
 * Resource Group Creation: Creates resource groups to organize and manage Azure resources effectively.
 * Role Assignment (Optional): Assigns roles for access control and security management.
 * Resource Usage Retrieval: Retrieves resource usage details for a specified date range.
The script demonstrates essential Azure resource management skills and automates tasks for efficient resource management.


Ensure seamless management of Azure resources by setting up the PowerShellGet module and the PSGallery repository. These steps are crucial for efficient resource management using PowerShell.


Azure Subscription Management:

Effortlessly sign in and select the right Azure subscription with the script. Simplify subscription management tasks for enhanced productivity.


Resource Group Creation:

Organize and manage Azure resources effectively by creating resource groups. The script automates the process, ensuring resources are structured for easy management.


Role Assignment (Optional):

Enhance security and streamline operations by assigning roles with the script. Customizable to assign the "Contributor" role to the Automation Account, bolstering DevOps practices.


Resource Usage Retrieval:

Efficiently retrieve resource usage details with the script. Seamlessly query Azure consumption usage by providing start and end dates, offering valuable insights.


This script showcases essential skills in Azure resource management, role-based access control (RBAC), and automation. Tailor it to your needs for streamlined Azure resource management and automated task execution. 

pwsh ./Az.ps1
PowerShellGet is installed. Ensuring it's up to date.
WARNING: The version '1.4.8.1' of module 'PackageManagement' is currently in use. Retry the operation after closing the applications.
WARNING: The version '2.2.5' of module 'PowerShellGet' is currently in use. Retry the operation after closing the applications.
Setting PSGallery as trusted...

   Tenant: Default Directory 
(0856a68e-24c0-425e-b382-42faaf84b24b)

SubscriptionName SubscriptionId                       Account
---------------- --------------                       -------  
SkyNetLab        5ed968f6-a0e5-49c9-897b-ab7eb32ea028 expertpc…
Resource group 'AutomationAz' already exists.

PS /home/dev> pwsh ./Az.ps1
PowerShellGet is installed. Ensuring it's up to date.
WARNING: The version '1.4.8.1' of module 'PackageManagement' is currently in use. Retry the operation after closing the applications.
WARNING: The version '2.2.5' of module 'PowerShellGet' is currently in use. Retry the operation after closing the applications.
Setting PSGallery as trusted...

   Tenant: Default Directory 
(0856a68e-24c0-425e-b382-42faaf84b24b)

SubscriptionName SubscriptionId                       Account
---------------- --------------                       -------  
SkyNetLab        5ed968f6-a0e5-49c9-897b-ab7eb32ea028 expertpc…
Resource group 'AutomationAz' already exists.
Do you want to get Resource usage? (Y/N): y
Enter the start date (format: YYYY-MM-DD): 2024-06-01
Enter the end date (format: YYYY-MM-DD): 2024-06-26

Date        : 6/1/2024 12:00:00 AM
Day         : 1
DayOfWeek   : Saturday
DayOfYear   : 153
Hour        : 0
Kind        : Unspecified
Millisecond : 0
Microsecond : 0
Nanosecond  : 0
Minute      : 0
Month       : 6
Second      : 0
Ticks       : 638527968000000000
TimeOfDay   : 00:00:00
Year        : 2024
DateTime    : Saturday, June 1, 2024 12:00:00 AM


Date        : 6/26/2024 12:00:00 AM
Day         : 26
DayOfWeek   : Wednesday
DayOfYear   : 178
Hour        : 0
Kind        : Unspecified
Millisecond : 0
Microsecond : 0
Nanosecond  : 0
Minute      : 0
Month       : 6
Second      : 0
Ticks       : 638549568000000000
TimeOfDay   : 00:00:00
Year        : 2024
DateTime    : Wednesday, June 26, 2024 12:00:00 AM

No usage details found for the specified date range.
