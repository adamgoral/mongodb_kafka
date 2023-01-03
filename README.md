# MongoDB Source Connector POC

## Prerequisites

### 1. Initialise containers

```bash
docker-compose up -d
```

### 2. Initialise mongodb replica set

```bash
docker exec mongo1 /scripts/rs-init.sh
```

### 3. Create source connector in kafka connect

```bash
create-source.sh
```

Verify if new connector is available by accessing the following URL:

```bash
curl -X GET http://connect:8083/connectors
```

you should see the following output:

```json
["mongo-source"]
```

## Create new record in mongodb

```bash
docker exec mongo1 /scripts/create-record.sh
```

Consumer logs should show events arriving on `quickstart.sampleData` topic

```log
2023-01-03 00:11:24 [2023-01-03 00:11:24,416] [1] [WARNING] received {'schema': {'type': 'string', 'optional': False}, 'payload': '{"_id": {"_data": "8263B372AB000000012B022C0100296E5A100461CEEFED7CF9455297BFB969C09DBDCC46645F6964006463B372AB0C9FF275CCE3F8870004"}, "operationType": "insert", "clusterTime": {"$timestamp": {"t": 1672704683, "i": 1}}, "fullDocument": {"_id": {"$oid": "63b372ab0c9ff275cce3f887"}, "test": "test value3", "travel": "MongoDB Kafka Connector"}, "ns": {"db": "quickstart", "coll": "sampleData"}, "documentKey": {"_id": {"$oid": "63b372ab0c9ff275cce3f887"}}}'}
```
