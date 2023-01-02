curl -X POST \
     -H "Content-Type: application/json" \
     --data '
     {"name": "mongo-source",
      "config": {
         "connector.class":"com.mongodb.kafka.connect.MongoSourceConnector",
         "connection.uri":"mongodb://mongodb-kafka-user:mongodb-kafka-password@mongodb:27017",
         "database":"quickstart",
         "collection":"sampleData",
         "pipeline":"[{\"$match\": {\"operationType\": \"insert\"}}, {$addFields : {\"fullDocument.travel\":\"MongoDB Kafka Connector\"}}]"
         }
     }
     ' \
     http://localhost:8083/connectors -w "\n"