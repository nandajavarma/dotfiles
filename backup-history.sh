#!/usr/bin/env bash

gcloud auth activate-service-account --key-file=/home/gitpod/.config/gcloud/application_default_credentials.json

gsutil cp ~/.zsh_history gs://gitpod-history/.zsh_history
