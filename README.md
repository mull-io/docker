# müll.io - docker

> NOTE. Currently only a dummy integration! This is not usable at the moment.
> 
Ready to use docker container to get müll.io information via müll.io CLI. Just set the address information as ENV
variables and use the `/cgi-bin/output.cgi` to get the information.

## Build the image

```
docker build --no-cache -t muell-io .
```

## Run the image

```
docker run --rm -it \
    --name muell-io \
    -e MUELL_STREET="Schürhornweg" \
    -e MUELL_HOUSE_NUMBER="1" \
    -e MUELL_ZIP="33649" \
    -e MUELL_CITY="Bielefeld" \
    -e MUELL_COUNTRY="DE" \
    -p 8080:80 muell-io
```

## Env Variables

| Name               | Example value |
|--------------------|---------------|
| MUELL_STREET       | Schürhornweg  |
| MUELL_HOUSE_NUMBER | 1             |
| MUELL_ZIP          | 33649         |
| MUELL_CITY         | Bielefeld     |
| MUELL_COUNTRY      | DE            |

Call http://localhost:8080/cgi-bin/output.cgi

@todo https://docs.github.com/de/actions/tutorials/publish-packages/publish-docker-images