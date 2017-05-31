# dg-bf-tideprediction

A simple service providing a series of REST Endpoint for predicting tides based on time and location.


## Running locally for development

Requires:

- Python 2.7 with `virtualenv` installed
- `virtualenv`

From the terminal, execute:

```
./scripts/develop.sh
```


## Running unit tests

From the terminal, execute:

```
./scripts/test.sh
```


## Deploying Manually

1. From the terminal, execute:

```bash
./scripts/package.sh

cf push -f manifest.jenkins.yml
```
