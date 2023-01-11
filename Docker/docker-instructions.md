# 1. Creating the Docker image for the Uber app

In this lab you will create a Docker image to containerize the Uber app.

## Create The Docker Image

1. `cd` into the *Docker* directory where you will see a *Dockerfile* and *app* directory. The app directory is what stores the Python application and the Dockerfile will be used to build the app.

2. Open the Dockerfile

3. Within the Dockerfile, you'll see a few key components
   - The Docker image that's being used is Python. It's using the latest version
   - There's a new directory being created called `/build`, which is where the Python app will reside
   - The *app* directory will be copied into the `/build` directory, along with the `requirements.txt` file to install all of the Python requirements for the app
   - The app will run as soon as the container gets created and comes up

4. To create the Docker image, you'll run the following command:
`docker build -t uberapp .`

The `-t` is for the tag (the name) of the Docker image and the `.` is telling the Docker CLI that the Dockerfile is in the current directory

5. After the Docker image is created, run the following command to confirm the Docker image is on your machine.
`docker image ls`

## Run The Docker Image Locally

Now that the Docker image is created, you can run the container locally just to confirm it'll work and not crash.

1. To run the Docker container, run the following command:
`docker run -tid uber`

- `t` stands for a TTY console
- `i` stands for interactive
- `d` stands for detach so your terminal isn't directly connected to the Docker container

2. To confirm the Docker container is running, run the following command:
`docker container ls`

You should now see the container running.



# 2. Push Image To ECR

The ECR repo will be where you store the Docker image that you created on your local computer in step 1.

## Log Into The ECR Repository
1. Terraform Code
2. Log in to ECR with AWS CLI
`aws ecr get-login-password --region *your_aws_region* | docker login --username AWS --password-stdin *your_aws_account_id*.dkr.ecr.*your_aws_region*.amazonaws.com`


## Tag The Docker image
1. Tag the Docker image
`docker tag uber *your_aws_account_id*.dkr.ecr.*your_aws_region*.amazonaws.com/*repo_name*`

## Push The Docker Image To ECR
1. Push the Docker image to ECR
`docker push *your_aws_account_id*.dkr.ecr.*your_aws_region*.amazonaws.com/*repo_name*`