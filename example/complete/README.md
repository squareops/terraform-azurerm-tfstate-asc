<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azure"></a> [azure](#requirement\_azure) | >= 3.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backend"></a> [backend](#module\_backend) | [squareops/tfstate/azurerm](https://github.com/squareops/terraform-azure-tfstate/tree/main) | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_bucket\_name) | Name of the Storage container to be created. | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Specify the type of environment(dev, demo, prod) in which the Storage account, Storage container and resource group will be created. | `string` | `"demo"` | no |
| <a name="input_region"></a> [region](#input\_region) | Specify the region in which the Storage account, Storage container and resource group will be created. | `string` | `"East US"` | no |
| <a name="input_name"></a> [name](#input\_name) | Specify the name of the project where Storage account, Storage container and resource group will be created. | `string` | `"skaf"` | no |
| <a name="input_additional_tags"></a> [additional_tags](#input\_additional_tags) | Specify the tags for the resources such as Storage account, Storage container and resource group will be created. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="terraform_state_resource_group_name"></a> [terraform\_state\_resource\_group\_name](#output\_terraform\_state\_resource\_group\_name) | Name of the Resource Group that will be used to maintain resources list. |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_log\_bucket\_name) | Name of the Storage account where storage container will be created for storing tfstate. |
| <a name="output_storage_container_name"></a> [state\_storage\_container\_name](#output\_state\_storage\_container\_name) | Name of the Storage container where tfstate will be stored. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Security, Validation and pull-requests
we have offered here high standard, quality code. Hence we are using several [pre-commit hooks](.pre-commit-config.yaml) and [GitHub Actions](https://gitlab.com/squareops/aws/eks/-/tree/v1.0.0#security-validation-and-pull-requests) as a workflow. So here we will create pull-requests to any branch and validate the request automatically using pre-commit tool.

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/).

## Support Us

To support a GitHub project by liking it, you can follow these steps:

  1. Visit the repository: Navigate to the GitHub repository.

  2. Click the "Star" [button](https://github.com/squareops/terraform-azure-tfstate): On the repository page, you'll see a "Star" button in the upper right corner. Clicking on it will star the repository, indicating your support for the project.

  3. Optionally, you can also leave a comment on the repository or open an issue to give feedback or suggest changes.

Starring a repository on GitHub is a simple way to show your support and appreciation for the project. It also helps to increase the visibility of the project and make it more discoverable to others.

To report an issue with a project:

  1. Check the repository's [issue tracker](https://github.com/squareops/terraform-azure-tfstate/issues) on GitHub
  2. Search to see if the issue has already been reported
  3. If you can't find an answer to your question in the documentation or issue tracker, you can ask a question by creating a new issue. Make sure to provide enough context and details.

  4. Optionally, you can also leave a comment on the repository or open an issue to give feedback or suggest changes.

Starring a repository on GitHub is a simple way to show your support and appreciation for the project. It also helps to increase the visibility of the project and make it more discoverable to others.

## Who we are

We believe that the key to success in the digital age is the ability to deliver value quickly and reliably. That’s why we offer a comprehensive range of DevOps & Cloud services designed to help your organization optimize its systems & Processes for speed and agility.

  1. We are an AWS Advanced consulting partner which reflects our deep expertise in AWS Cloud and helping 100+ clients over the last 4 years.
  2. Expertise in Kubernetes and overall container solution helps companies expedite their journey by 10X.
  3. Infrastructure Automation is a key component to the success of our Clients and our Expertise helps deliver the same in the shortest time.
  4. DevSecOps as a service to implement security within the overall DevOps process and helping companies deploy securely and at speed.
  5. Platform engineering which supports scalable,Cost efficient infrastructure that supports rapid development, testing, and deployment.
  6. 24*7 SRE service to help you Monitor the state of your infrastructure and eradicate any issue within the SLA.

We provide [support](https://squareops.com/contact-us/) on all of our projects, no matter how small or large they may be.

You can find more information about our company on this [squareops.com](https://squareops.com/), follow us on [linkdin](https://www.linkedin.com/company/squareops-technologies-pvt-ltd/), or fill out a [job application](https://squareops.com/careers/). If you have any questions or would like assistance with your cloud strategy and implementation, please don't hesitate to [contact us](https://squareops.com/contact-us/).