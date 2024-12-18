# project-fly

Este proyecto de Terraform despliega una infraestructura básica en AWS que incluye:

- Una **VPC** (Virtual Private Cloud) con subredes públicas y privadas.
- Un **cluster de EKS** (Elastic Kubernetes Service).
- Un **bucket de S3**.
- Un **repositorio de ECR** (Elastic Container Registry).
- Un **pod en EKS** con dos contenedores, uno de los cuales ejecuta un script que obtiene la IP privada y la guarda periódicamente en archivos con nombres basados en timestamps.

## Estructura del Proyecto

La estructura del proyecto es la siguiente:
├── main.tf # Archivo principal de Terraform, contiene la definición de los recursos de AWS 
├── variables.tf # Define las variables utilizadas en la configuración de Terraform 
├── outputs.tf # Define los outputs de la infraestructura
├── eks-pod.yaml # Definición de los pods y contenedores de EKS ├── README.md # Este archivo de documentación

### Descripción de los Archivos

- **main.tf**: Este archivo contiene los recursos de infraestructura de AWS. Aquí se define la creación de la VPC, subredes, el cluster de EKS, el bucket S3 y el repositorio de ECR.
- **variables.tf**: Este archivo contiene la definición de las variables de configuración de Terraform, como la región de AWS.
- **outputs.tf**: Aquí se definen los outputs del proyecto, como el ID de la VPC, la URL del repositorio ECR, y el nombre del bucket S3.
- **eks-pod.yaml**: Este archivo contiene la definición de los pods de Kubernetes, especificando dos contenedores. Uno de ellos ejecuta un script en Bash o Python que obtiene la IP privada de la instancia y la guarda en un archivo con el timestamp.

## Requisitos

- **Terraform**: Asegúrate de tener Terraform instalado en tu máquina. Puedes descargarlo desde [terraform.io](https://www.terraform.io/downloads.html).
- **AWS CLI**: Debes tener configurado AWS CLI con las credenciales adecuadas para poder interactuar con tu cuenta de AWS.
- **kubectl**: Para interactuar con el cluster de EKS y verificar el estado de los pods.

## Configuración Inicial

1. **Configura tus credenciales de AWS**:
   Asegúrate de tener configuradas tus credenciales de AWS. Si no lo has hecho, ejecuta:

   ```bash
   aws configure


### Ejecución del Proyecto

- **Inicializar Terraform**: terraform init
- **Planificar la Infraestructura**: terraform plan -out=plan.tfplan
- **Aplicar el Plan**: terraform apply plan.tfplan
- **Configurar kubectl para el Cluster EKS**: aws eks --region us-west-2 update-kubeconfig --name my-cluster
- **Desplegar los Pods en EKS**: kubectl apply -f eks-pod.yaml
- **Verificar los Pods**: kubectl get pods
- **Acceder al Pod**: kubectl exec -it my-pod -- /bin/bash

### Limpieza

- **Eliminar los componentes creados**: terraform destroy


