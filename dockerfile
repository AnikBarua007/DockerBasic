# This is a comment

# Use a lightweight debian os
# as the base image
FROM debian:stable-slim
# COPY source destination
COPY DockerBasic.git /bin/DockerBasic.git
CMD ["/bin/DockerBasic.git"]