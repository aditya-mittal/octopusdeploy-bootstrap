locals {
  octopus_endpoint            = "https://my.octopus.app/"
}

module "space_developer_role" {
  source      = "../modules/roles"
  description = "Responsible for all development-related tasks."
  name        = "Developers"
  developer_role_space_permissions = [
    "AccountView",
    "ActionTemplateView",
    "ArtifactView",
    "BuiltInFeedDownload",
    "CertificateView",
    "DeploymentCreate",
    "DeploymentView",
    "EnvironmentView",
    "EventView",
    "FeedView",
    "LifecycleCreate",
    "LifecycleView",
    "MachinePolicyView",
    "MachineView",
    "ProcessEdit",
    "ProcessView",
    "ProjectEdit",
    "ProjectGroupCreate",
    "ProjectGroupDelete",
    "ProjectGroupEdit",
    "ProjectGroupView",
    "ProjectView",
    "ProxyView",
    "ReleaseCreate",
    "ReleaseEdit",
    "ReleaseView",
    "RunbookView",
    "SubscriptionView",
    "TaskView",
    "TeamCreate",
    "TeamEdit",
    "TeamView",
    "TriggerView",
    "VariableEdit",
    "VariableEditUnscoped",
    "VariableView",
    "VariableViewUnscoped",
    "WorkerView"
  ]
  providers = {
    octopusdeploy = octopusdeploy.global-resources
  }
}