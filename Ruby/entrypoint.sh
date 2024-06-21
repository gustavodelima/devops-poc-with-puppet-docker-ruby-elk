#!/bin/bash 
set -e 

exec bundle exec puma -C config/puma.rb 