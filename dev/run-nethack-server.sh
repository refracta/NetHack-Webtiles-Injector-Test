#!/bin/bash
npm install --no-bin-links --prefix ./server
npm start --prefix ./server | tee ./server/latest.log
