
# Create workload identity pool provider - 1 per repo+deployment combination.
# Specific to bitbucket because of the attribute mappings aren't going to be
# the same with different vendors.
resource "google_iam_workload_identity_pool_provider" "bitbucket" {
  provider                           = google-beta
  project                            = var.project_id
  workload_identity_pool_id          = var.identity_pool_id
  workload_identity_pool_provider_id = var.provider_id
  display_name                       = var.provider_id
  description                        = "Bitbucket (OIDC) identity pool provider for ${var.identity_pool_name} ${var.provider_id}"
  disabled                           = false
  attribute_mapping = {
    "google.subject"                      = "assertion.sub"
    "attribute.deploymentenvironmentuuid" = "assertion.deploymentEnvironmentUuid"
    "attribute.repositoryuuid"            = "assertion.repositoryUuid"
    "attribute.workspaceuuid"             = "assertion.workspaceUuid"
    "attribute.pipelineuuid"              = "assertion.pipelineUuid"
  }
  attribute_condition = "(attribute.deploymentenvironmentuuid == '{${var.bb_deployment_uuid}}') && (attribute.repositoryuuid == '{${var.bb_repository_uuid}}')"
  oidc {
    allowed_audiences = ["ari:cloud:bitbucket::workspace/${var.bb_workspace_uuid}"]
    issuer_uri        = var.bb_identity_provider_url
  }
}


