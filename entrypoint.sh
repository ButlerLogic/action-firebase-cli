#!/bin/sh

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "Cannot find FIREBASE_TOKEN. Was it configured in the repository secrets?"
    exit 1
fi

if [ -z "${FIREBASE_PROJECT}" ]; then
    echo "FIREBASE_PROJECT is missing"
    exit 1
fi
