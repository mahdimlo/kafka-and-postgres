#!/bin/bash

pg_basebackup -D /backup/standalone-"$(date +%Y-%m-%dT%H-%M)" -c fast -PR