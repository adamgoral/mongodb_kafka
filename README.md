
```bash
create-source.sh
```

check if new connector is available by accessing the following URL:

```bash
curl -X GET http://connect:8083/connectors
```

you should see the following output:

```bash
["mongo-source"]
```