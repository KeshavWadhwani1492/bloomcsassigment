# bloomcsassigment

Summary of Terraform Plan:
The Terraform plan aims to create a comprehensive set of resources for hosting a production-grade Angular web app with the following components:
1.	Resource Group: A resource group (webapp-prod-rg) in the westus2 region.
2.	Log Analytics Workspace: A log analytics workspace (prod-law) for monitoring and logging.
3.	Service Plan: An app service plan (prod-app-service-plan) with a premium SKU (P1v2) for hosting the web app on a Linux environment.
4.	Web App: A production Linux-based web app (prod-api-webapp), hosted on the service plan.
5.	CDN: A CDN profile and endpoint to serve the web app's static content.
6.	Storage Account: A storage account (prodwebappstorage) for storing the web app's static files.
7.	Key Vault: A key vault (webapp-prod-kv) for storing sensitive data like database connection strings and secrets.
8.	SQL Database: A SQL Server (prod-sql-server) and SQL Database (prod-db), with dynamically generated admin credentials stored securely in Key Vault.
   
Enterprise Considerations (Security, Reliability, and Reusability):

1. Security:
   
•	Key Vault for Secrets: The database connection string and SQL Server admin credentials are securely stored in Azure Key Vault. Access policies ensure that only authorized services (e.g., the web app) can access these secrets, minimizing exposure.
•	Access Control: Role-based access control (RBAC) and access policies are applied to ensure only authorized entities (e.g., managed identities or specific users) can access sensitive resources like Key Vault and database.
•	Private Network Access: Public network access to the SQL Server is disabled, which ensures that it's not directly accessible over the internet. This improves security.
•	HTTPS: The web app is configured to allow only HTTPS traffic, securing communications.

2. Reliability:
   
•	App Service Plan Premium SKU (P1v2): The service plan uses a high-availability configuration (Premium SKU), ensuring the app can scale to meet demand and providing features like automatic scaling and enhanced performance.
•	Geo-Redundancy: The SQL Server and storage account can support geo-backups, ensuring data redundancy and minimizing data loss risks.
•	Diagnostic Settings: Logs and metrics are configured for collection, providing visibility into the system’s health, performance, and security.
•	CDN for Content Delivery: The use of a CDN ensures fast and reliable delivery of static content, improving performance for end-users.

3. Reusability:
   
•	Modular Approach: Resources like the web app, service plan, storage account, and CDN are created in modular blocks, making it easy to reuse this code for similar deployments in other environments (e.g., dev, staging).
•	Key Vault for Secrets: By using Key Vault for sensitive data management, the solution promotes reusability across environments where different secrets may be needed but the overall architecture remains the same.
•	Parameterization: Variables in the Terraform code (like resource_group_name, location, and sku) allow for easy adjustments and reuse across different environments and deployment scenarios.


Conclusion:

The Terraform plan reflects strong consideration of enterprise requirements:
•	Security is prioritized through proper management of sensitive data, access policies, and network restrictions.
•	Reliability is addressed with high-availability configurations, redundancy, and diagnostic settings.
•	Reusability is ensured by creating modular resources and leveraging parameters to enable easy deployment in multiple environments.

