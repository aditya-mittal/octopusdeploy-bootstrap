# octopus-space-bootstrap
This repo has the terraform modules which helps you bootstrap your octopus by creating resources like:
- Global Resources(Roles)
- Space
- Deployment Targets
- Accounts
- Environments
- Lifecycle
- External Feeds

## Global Resources
---

Provision global resources for your OctopusDeploy.

### Pre-requisites

- [terraform 1.2.6](https://learn.hashicorp.com/terraform/getting-started/install.html)

### Steps to provision

```bash
$ cd global-resources
$ terraform init
$ terraform get -update=true
$ terraform plan -out tfplan
$ terraform apply
```

### Steps to de-provision

```bash
$ cd global-resources
$ terraform init
$ terraform get -update=true
$ terraform plan -destroy -out destroy_tfplan
$ terraform apply destroy_tfplan
```

## Space & Bootstrapping
---

Provision space and bootstrap it with all necessary resources like environments, lifecycles and deployment targets.

### Pre-requisites

- [terraform 1.2.6](https://learn.hashicorp.com/terraform/getting-started/install.html)

### Steps to provision

```bash
$ cd my-space
$ terraform init
$ terraform get -update=true
$ terraform plan -out tfplan
$ terraform apply
```

### Steps to de-provision

```bash
$ cd my-space
$ terraform init
$ terraform get -update=true
$ terraform plan -destroy -out destroy_tfplan
$ terraform apply destroy_tfplan
```

Note: You can change/copy the folder name <my-space> to any other name you want and provision a space with that name. Also, you can have more than one folder if needed.