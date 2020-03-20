#!/bin/sh

if [[ -v FIREBASE_TOKEN ]]; then
    echo "Cannot find FIREBASE_TOKEN. Was it configured in the repository secrets?"
    exit 1
fi

if [[ -v FIREBASE_PROJECT ]]; then
    echo "FIREBASE_PROJECT is missing"
    exit 1
fi

if [[ -v COMMAND ]]; then
  echo "COMMAND is missing. Nothing to run."
  exit 1
fi

if [[ -v PRECOMMAND ]]; then
  ${PRECOMMAND}
fi

firebase ${COMMAND} \
  -m "${GITHUB_SHA}" \
  --project ${FIREBASE_PROJECT}