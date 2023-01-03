#!/bin/bash

mongo <<EOF
db = connect("localhost:27017/quickstart");
db.getCollection('sampleData').insertOne({'test': 'test value3'});
EOF