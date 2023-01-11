# 1. Connecting To Elastic Kubernetes Service (EKS)

When you're deploying locally, without any CI/CD to EKS, you'll need to authenticate from your local terminal.

Once you authenticate to EKS from your local terminal, a `kubeconfig` gets stored on your computer. The `kubeconfig` has all of the connection information and authentication needs to connect to EKS.

## Connecting To EKS

1. Run the following command to connect to EKS:
`aws eks --region *your_aws_region* update-kubeconfig --name *your_eks_cluster_name`

2. Once connected, you should be able to run commands like the following to confirm you're connected:
`kubectl get nodes`



# 2. Create The Kubernetes Manifest

At this point you have successfully created a Docker image from the Uber app and stored it in ECR.

Now it's time to set up the Kubernetes manifest, which will take the application and deploy it to EKS.

## The Manifest

The Kubernetes manifest will consist of two components:
- The deployment
- The service

The deployment is what gets the application running in Kubernetes

The service is what exposes the Kubernetes application so you can, for example, reach the frontend from a load balancer hostname or IP.

The manifest can be found in the `kubernetes_manifest` directory. Ensure on line `31` to change the image URL to the one you have in your AWS account.



# 3. Deploy The Uber App

Once the EKS cluster is built and the Kubernetes manifest is ready, you're now ready to deploy the Kubernetes manifest.

1. `cd` into the `kubernetes_manifest` directory
2. Run the following command:
`kubectl create -f deployment.yml`

You'll see an output that specifies the service and deployment was created.

3. Run the following command to confirm that the deployment was successful:
`kubectl get deployments`
