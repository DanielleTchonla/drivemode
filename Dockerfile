FROM python:3.13

# Install mkdocs inside the container
RUN pip install mkdocs

# Set our working directory
WORKDIR /home

# Copy the script inside container
COPY script.sh /entrypoint.sh

# Make sure the script is executable
RUN chmod +x /entrypoint.sh

# Set an entrypoint
ENTRYPOINT [ "/entrypoint.sh" ]