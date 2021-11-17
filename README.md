# Create a Workload Identity Pool Provider for Bitbucket Pipelines via OpenID Connect (OIDC)

This module will create a workload identity pool provider specifically designed to allow Bitbucket pipelines access.
* This is designed to work with module "llcloudstudio/bitbucket-workload-identity-pool/google". Ensure you use the same gcp_project_ids.
* This pool will restrict access to a specific combination of Bitbucket workspace+repository+deployment uuids.


## Quick start

To use this module: 
1. Obtain the following information from your Bitbucket deployment: 
  bb_deployment_uuid:
    repository -> repository settings -> openid connect -> select deployment -> record uuid 

  bb_repository_uuid:
    repository -> repository settings -> openid connect -> record repository uuid

  bb_workspace_uuid:
    repository -> repository settings -> openid connect -> record workspace uuid

  bb_identity_provider_url:
    repository -> repository settings -> openid connect -> record identity_provider_url




1. In your main.tf include the following: 
```
locals {
  bb_workspace_uuid        = "xxxxx-xxx-xxx-xxx-xxxx"
  bb_repository_uuid       = "xxxxx-xxx-xxx-xxx-xxxx"
  bb_deployment_uuid       = "xxxxx-xxx-xxx-xxx-xxxx"
  bb_identity_provider_url = "https://api.bitbucket.org/2.0/workspaces/xxxxxxxxxx/pipelines-config/identity/oidc"
}

module "identity_provider_for_pipeline-a" {
  source                   = "llcloudstudio/bitbucket-identity-pool-provider/google"
  project_id               = "gcp_project_id"
  provider_id              = "name_of_bb_deployment"
  identity_pool_name       = "identity_pool_name"
  identity_pool_id         = "identity_pool_id""
  bb_deployment_uuid       = local.bb_workspace_uuid
  bb_repository_uuid       = local.bb_repository_uuid
  bb_workspace_uuid        = local.bb_deployment_uuid
  bb_identity_provider_url = local.bb_identity_provider_url
}
```
1. Run terraform validate and fix any issues that appear.    
1. Run terraform plan and confirm you are ok with what will be deployed.   
1. Run terraform apply to have the resources deployed.
