# Docker for R and R Studio

![R Studio](images/rstudio.png)

Creates a docker image with R and R Studio installed.

# Usage

To build the image :

<code>
cd <directory_with_dockerfile>
docker build -t <image_name> .
</code>

To run the image :

<code>
docker run -t -i <image_name> -v <local_path_to_r_project>:/var/lib/R
</code>
