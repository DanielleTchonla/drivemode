# drivemode

## Build image
docker build -t mkdocs-producer .

## Run container
docker run --rm -v $(pwd)/my-mkdocs-site:/input mkdocs-producer produce > site.tar.gz

## Serve site
cat site.tar.gz | docker run --rm -i -p 8000:8000 mkdocs-producer serve