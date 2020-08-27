#!/bin/bash
npm install --prefix ./server
npm start --prefix ./server | tee ./server/latest.log
