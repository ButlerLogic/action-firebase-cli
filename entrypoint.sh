#!/bin/sh

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "Cannot find FIREBASE_TOKEN. Was it configured in the repository secrets?"
    exit 1
fi

if [ -z "${FIREBASE_PROJECT}" ]; then
    echo "FIREBASE_PROJECT is missing"
    exit 1
fi

if [ -z "${FIREBASE_COMMAND}" ]; then
  echo "COMMAND is missing. Nothing to run."
  exit 1
fi

if [ -n "${PRERUN}" ]; then
  ${PRERUN}
fi

firebase ${FIREBASE_COMMAND} \
  -m "${GITHUB_SHA}" \
  --project ${FIREBASE_PROJECT}