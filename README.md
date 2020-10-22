---
page_type: sample
languages:
- nodejs
products:
- nodejs
description: "This code is part of the Microsoft Learn module of the AKS workshop. It provides the API for the ratings application. The API connects to a MongoDB to store and retrieve data."
urlFragment: "aksworkshop-ratings-api"
---

# AKS Workshop - ratings-api sample code

## Forked from 
https://github.com/MicrosoftDocs/mslearn-aks-workshop-ratings-api

## Guidelines on README format: 
https://review.docs.microsoft.com/help/onboard/admin/samples/concepts/readme-template?branch=master

## Guidance on onboarding samples to docs.microsoft.com/samples: 
https://review.docs.microsoft.com/help/onboard/admin/samples/process/onboarding?branch=master

## Taxonomies for products and languages: 
https://review.docs.microsoft.com/new-hope/information-architecture/metadata/taxonomies?branch=master


This code is part of the Microsoft Learn module of the AKS workshop. It provides the API for the ratings application. The API connects to a MongoDB to store and retrieve data.

## Contents

| File/folder       | Description                                |
|-------------------|--------------------------------------------|
| `routes`          | API endpoint implementation.               |
| `models`          | Representation of API data model.          |
| `data`            | Data to be preloaded into the database.    |
| `views`           | Handelbars HTML view templates.            |
| `server.js`       | NodeJS web server startup file.            |
| `app.js`          | Express NodeJS application startup file.   |
| `.gitignore`      | Define what to ignore at commit time.      |
| `.dockerignore`   | Define what to ignore at build time.       |
| `Dockerfile`      | Define how the Docker image is built.      |
| `README.md`       | This README file.                          |
| `LICENSE`         | The license for the sample.                |

## Prerequisites

To build this sample locally, you can either build using Docker, or using NPM.

- Install [Docker](https://www.docker.com/get-started)
- Install [NodeJS](https://nodejs.org/en/download/)

## Setup

- To build using Docker, in the project folder, run `docker build -t ratings-api .`
- To build using NPM, in the project folder, run `npm install`

## Running the sample

- To run using Docker, run `docker run -it -p 3000:3000 ratings-api`

```
$ docker images
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
ratings-api               latest              f331d8f07cb9        5 minutes ago       336MB
<none>                    <none>              d976738eafc0        17 minutes ago      318MB
mysql                     5.7                 2836a03e922f        2 days ago          448MB
ratings-web               latest              15f7a3ef14f6        2 days ago          476MB
yanmingxiao/ratings-web   2.0                 15f7a3ef14f6        2 days ago          476MB
yanmingxiao/ratings-api   2.0                 71d75a2c60c0        2 days ago          336MB
yanmingxiao/ratings-api   1.0                 d90e5bb04d08        2 days ago          336MB
wordpress                 latest              ec5c071010b5        8 days ago          546MB
bitnami/mongodb           latest              fc1a140abb10        9 days ago          497MB
node                      13.5-alpine         e1495e4ac50d        10 months ago       111MB
$ docker tag 71d75a2c60c0 yanmingxiao/ratings-api:latest
$ docker push   yanmingxiao/ratings-api
```


- To run using NPM, run `npm start`

Required configuration via environment variables:

- MONGODB_URI: MongoDB connection is configured using an environment variable called `MONGODB_URI`. This URI should look like `mongodb://[username]:[password]@[endpoint]:27017/ratingsdb`

The API exposes port 3000.

You should then be able to access the API at <http://localhost:3000/api/items>

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
