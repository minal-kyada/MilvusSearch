from flask import Flask,Response,jsonify, render_template ,logging,request
import openai
from openai import OpenAI
from pymilvus import connections, FieldSchema, CollectionSchema, DataType, Collection, utility
from flask_cors import CORS
app = Flask(__name__)
CORS(app)
openAiClient = OpenAI(api_key='ADD-YOUR-OPENAI-API-KEY')


COLLECTION_NAME = 'reviews'  # Collection name
DIMENSION = 1536  # Embeddings size
MILVUS_HOST = 'localhost'  # Milvus server URI
MILVUS_PORT = '19530'
OPENAI_ENGINE = 'text-embedding-ada-002'  # Which engine to use
openai.api_key = 'ADD-YOUR-OPENAI-API-KEY'  # Use your own Open AI API Key here
QUERY_PARAM = {
    "metric_type": "L2",
    "params": {"ef": 64},
}

connections.connect(host=MILVUS_HOST, port=MILVUS_PORT)
fields = [
    FieldSchema(name='id', dtype=DataType.VARCHAR, description='Ids', is_primary=True, auto_id=False,max_length=64000),
    FieldSchema(name='Business_name', dtype=DataType.VARCHAR, description='Business_name',max_length=64000),
    FieldSchema(name='zipcode', dtype=DataType.VARCHAR, description='Zipcode', max_length=64000),
    FieldSchema(name='business_community', dtype=DataType.VARCHAR, description='Business Community', max_length=64000),
    FieldSchema(name='rating', dtype=DataType.FLOAT, description='Rating'),
    FieldSchema(name='review', dtype=DataType.VARCHAR, description='Review',max_length=64000),
    FieldSchema(name='date_reviewed', dtype=DataType.VARCHAR,description='Date of the review' ,max_length=64000),
    FieldSchema(name='embedding', dtype=DataType.FLOAT_VECTOR, description='Embedding vectors', dim=DIMENSION)
]

schema = CollectionSchema(fields=fields, description='Review collection')
collection = Collection(name=COLLECTION_NAME, schema=schema)


@app.route('/')
def home():
    return "Welcome to the backend"


@app.route('/query', methods=['POST'])
def queryDatabase():
    data = request.get_json()
    print(data)
    return query(data["inputText"],data["Expression"], top_k = 5);

# Filtered Search Function
def query(query,expr, top_k = 5):
    # print(query)
    text=query
    expr= expr
    output=[]
    res = collection.search([embed(text)], anns_field='embedding', expr=expr, param=QUERY_PARAM, limit = top_k, output_fields=['id', 'zipcode', 'business_community', 'rating', 'review', 'date_reviewed',"Business_name"])
    for i, hit in enumerate(res):
        print(f'\nDisplaying Top {top_k} Results for query "{text}"')
        for ii, hits in enumerate(hit):
            outputObj={
                "Rank":ii+1,
                "Review": hits.entity.get('review'),
                "Business_name":hits.entity.get('Business_name'),
                "Community":hits.entity.get('business_community'),
                'Rating': hits.entity.get('rating'),
                "Date":hits.entity.get('date_reviewed')
            }
            output.append(outputObj);
    return output;    
            
            
 # Fetch embeddings for each Review to insert into Milvus


def embed(text_to_embed):
    # Embed a line of text
    response = openAiClient.embeddings.create(input=text_to_embed, model=OPENAI_ENGINE)
    # Return the list of embeddings
    return response.data[0].embedding
   
            

#run server
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
