# USAGE 

- To store ***.tfstate*** file in Azure cloud backend. 

- To apply change the name of ***backend.tfvars.reference*** to ***backend.tfvars*** and enter ***region*** and ***resources-group***.

- To apply:

``` 
terraform init 
terraform plan -var-file=vars/backend.tfvars -out plan.out
terraform apply plan.out
```

- **SAVE THE OUTPUTS**

- To destroy:

```
terraform destroy -var-file=vars/backend.tfvars"
```