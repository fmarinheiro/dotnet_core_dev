# .Net Core development docker image 

This images builds on `microsoft/dotnet:latest` to better integrate with the hosts file system so you don't run into permission problems.


- Create a new user named `app` that will assum the user and group id from the `HUID` and `HGID` environment variables.
- The default user `app` will have the `/home/app` home folder
- Install debugger for vs code
- Create the `workspace` folder inside the users home to mount the app files from the host 

By default, running the images without specifying a command will open bash for the `app` user. 

```
docker run -it fmarinheiro/dotnet_core_dev
```

If a command is specified it will execute it with the `app` user.

```
docker run -it fmarinheiro/dotnet_core_dev dotnet --help
```

On your local machine to avoid permission problems you should run the image providing you own user anf group id to the image.

```
docker run --name my_container -p 5000:5000 -it  -v $PWD:/home/app workspace fmarinheiro/dotnet_core_dev
```

This will open a bash where you can execute you dotnet commands as a non root user, and the file permissions of files created by the container will be right on the hosts side. 

If you prefer you can use docker exec:

```
 docker exec --user app encryptor_app dotnet build
```

