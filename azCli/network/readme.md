# Creating a Virtual Network (VNet) and Subnet

Use below code within the [Azure Cloud Shell](https://shell.azure.com) or [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) to create a Virtual Network (VNet), example values are provided next to parameters. The Subscription ID is your Subscription ID.

```bash
SUB_ID="" #EXAMPLE XX-YYYY-ZZZ

RG_NAME="" #EXAMPLE "RG1"

REGION="" #EXAMPLE "southafricanorth"

VNET_NAME="" #EXAMPLE "Network1"
SUBNET_NAME="" #EXAMPLE "subnet1"
VNET_PREFIX="" #EXAMPLE 172.16.0.0/16
SUBNET_PREFIX="" #EXAMPLE 172.16.1.0/24

az account set --subscription ${SUB_ID}
az network vnet create -g ${RG_NAME} -n ${VNET_NAME} --address-prefix ${VNET_PREFIX} --subnet-name ${SUBNET_NAME} --subnet-prefix ${SUBNET_PREFIX}
```