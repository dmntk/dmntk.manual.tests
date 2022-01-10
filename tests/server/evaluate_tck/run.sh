#!/usr/bin/env bash

# delete all existing models from workspace
curl -s -X POST http://127.0.0.1:22022/definitions/clear > /dev/null 2>&1

# prepare JSON data file containing a model to be added to workspace
echo -n '{"content":"' > data.json
base64 --wrap=0 2_0001.dmn >> data.json
echo -n '"}' >> data.json

# add model to workspace
curl -s -d '@data.json' -H "Content-Type: application/json" -X POST http://127.0.0.1:22022/definitions/add > /dev/null 2>&1

# delete data file
rm data.json

# deploy model
curl -s -X POST http://127.0.0.1:22022/definitions/deploy > /dev/null 2>&1

# evaluate model using generic input data format
curl -s -d '{"model":"compliance-level-2-test-0001","invocable":"Greeting Message","input":[{"name":"Full Name","value":{"simple":{"type":"xsd:string","text":"John Doe","isNil":false}}}]}' -H "Content-Type: application/json" -X POST http://127.0.0.1:22022/tck/eval