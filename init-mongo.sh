#!/bin/bash

mongo -- "$MONGO_INITDB_DATABASE" <<EOF
    var rootUser = '$MONGO_INITDB_ROOT_USERNAME';
    var rootPassword = '$(cat "$MONGO_INITDB_ROOT_PASSWORD")';
    var admin = db.getSiblingDB('admin');
    admin.auth(rootUser, rootPassword);

    db.metrics.insert({ website: 'mvpjava.com', hitcount: '1000' });
    db.metrics.insert({ website: 'triomni-it.com', hitcount: '2000' });
EOF
