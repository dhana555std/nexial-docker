"Steps to run on Windows" 




```
1. docker build -t nexial .

2. docker run -it --mount type=bind,source=c:\projects\<project_name>,target=/home/projects/<project_name> nexial sh
```
