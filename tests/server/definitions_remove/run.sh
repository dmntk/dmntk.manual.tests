#!/usr/bin/env bash

# run dmntk as a server
dmntk srv > /dev/null 2>&1 &
_pid=$!
sleep 0.1

# delete all existing models from workspace
curl -s -X POST http://0.0.0.0:22022/definitions/clear > /dev/null 2>&1

# prepare JSON data file containing a model to be added to workspace
echo -n '{"content":"' > data.json
base64 --wrap=0 2_0001.dmn >> data.json
echo -n '"}' >> data.json

# add model to workspace
curl -s -d '@data.json' -H "Content-Type: application/json" -X POST http://0.0.0.0:22022/definitions/add  > /dev/null 2>&1

# delete data file
rm data.json

# prepare JSON data for removing definition
echo -n '{"name":"compliance-level-2-test-0001","namespace":"https://dmntk.io/2_0001"}' > data.json

# remove model from workspace
curl -s -d '@data.json' -H "Content-Type: application/json" -X POST http://0.0.0.0:22022/definitions/remove

# delete data file
rm data.json

# stop dmntk server
kill "$_pid"