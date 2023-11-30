#!/bin/bash
                                           
#cp ../requirements.txt .

podman build --rm --no-cache --file Dockerfile --tag tensorflow:1.0 . 
