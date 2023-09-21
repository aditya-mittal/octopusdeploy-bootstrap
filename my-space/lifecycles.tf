resource "octopusdeploy_lifecycle" "My_Lifecycle_1" {
  description = "Description of the lifecycle"
  name        = "My_Lifecycle_1_pre_release"
  provider = octopusdeploy.space-bootstrapper

  release_retention_policy {
    quantity_to_keep    = 1
    should_keep_forever = false
    unit                = "Items"
  }

  tentacle_retention_policy {
    quantity_to_keep    = 1
    should_keep_forever = false
    unit                = "Items"
  }

  phase {
    optional_deployment_targets          = [module.dev_env.environment_id]
    name                                  = module.dev_env.environment_name
    is_optional_phase                     = false
    minimum_environments_before_promotion = 1

    release_retention_policy {
      quantity_to_keep    = 1
      should_keep_forever = false
      unit                = "Items"
    }

    tentacle_retention_policy {
      quantity_to_keep    = 1
      should_keep_forever = false
      unit                = "Items"
    }
  }
}

resource "octopusdeploy_lifecycle" "My_Lifecycle_2" {
  description = "description of the lifecycle"
  name        = "My_Lifecycle_2_release"
  provider = octopusdeploy.space-bootstrapper

  release_retention_policy {
    quantity_to_keep    = 60
    should_keep_forever = false
    unit                = "Days"
  }

  tentacle_retention_policy {
    quantity_to_keep    = 3
    should_keep_forever = false
    unit                = "Days"
  }

  phase {
    optional_deployment_targets          = [module.dev_env.environment_id]
    name                                  = module.dev_env.environment_name
    is_optional_phase                     = false
    minimum_environments_before_promotion = 1

    release_retention_policy {
      quantity_to_keep    = 60
      should_keep_forever = false
      unit                = "Days"
    }

    tentacle_retention_policy {
      quantity_to_keep    = 30
      should_keep_forever = false
      unit                = "Days"
    }
  }
  phase {
    optional_deployment_targets          = [module.qa_env.environment_id]
    name                                  = module.qa_env.environment_name
    is_optional_phase                     = false
    minimum_environments_before_promotion = 1

    release_retention_policy {
      quantity_to_keep    = 60
      should_keep_forever = false
      unit                = "Days"
    }

    tentacle_retention_policy {
      quantity_to_keep    = 3
      should_keep_forever = false
      unit                = "Days"
    }
  }
  phase {
    optional_deployment_targets          = [module.prod_env.environment_id]
    name                                  = module.prod_env.environment_name
    is_optional_phase                     = false
    minimum_environments_before_promotion = 0

    release_retention_policy {
      should_keep_forever = true
    }

    tentacle_retention_policy {
      quantity_to_keep    = 30
      should_keep_forever = false
      unit                = "Days"
    }
  }
}