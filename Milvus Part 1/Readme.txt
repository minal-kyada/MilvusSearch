This assignment can be divided into two Phases.

In Phase 1,
1. The main objective is to pull data from the YelpAPI .
2. We will be fetching different details like Businesses, Reviews, Categories, Cities, Community areas, States, Countries, Users.
3. All the Date objects inr the database must be of type date and not string
4. Store the data in Edgedb

In Phase 2,
1. We read the data stored in Edgedb and store it in Milvus which is a vector database.
2. We store all the Business reviews in Milvus Database as embeddings and these embeddings would be helpful for the vector similarity search.
3. We will be using  "text-embedding-ada-002" engine which is a new embedding model from OpenAI.
4. We will be using the Python Pymilvus library to for interacting with Milvus.


Attu Setup:

- First we need to get the docker-compose file from https://github.com/milvus-io/milvus/releases/download/v2.3.3/milvus-standalone-docker-compose.yml
- Rename it to docker-compose.yml
- Use the commands "docker compose up -d" to start the services.
- We will have milvus-etcd,milvus-minio and milvus-standalone services by default.
- Check if the services are started with the command "docker compose ps" command
- Once the services are started for the attu setup, we can either add an service in the docker-compose file run a command .
- The command is "docker run -p 8000:3000 -e MILVUS_URL={milvus server IP}:19530 zilliz/attu:v2.3.1".
- This command binds the port 0.0.0.0:8000 to the container port 3000 and now we can access attu at localhost:8000
- We shall add this part in docker-compose file to setup attu as a service.
                                attu:
                                    container_name: attu
                                    image: zilliz/attu:v2.2.6
                                    environment:
                                    MILVUS_URL: milvus-standalone:19530
                                    ports:
                                    - "8000:3000"
                                    depends_on:
                                    - "standalone"

- This part binds the port 0.0.0.0:8000 to the container port 3000 and now we can access attu at localhost:8000
- Once we get into the ui, we can give milvus address to login to attu.


Assignment notes:

- We have 2 ipynb files for 2 phases here.
- The first file gets data from yelp using YelpAPI and stores it in Edgedb
- The second file reads data from edgedb and stores it in Milvus Database.
