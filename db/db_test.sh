#!/bin/bash

sqlite3 database.db < schema.sql

sqlite3 database.db

## sqlite commands
# .tables (.tables 'var%' for search)



 # psql -h <hostname or ip address> -p <port number of remote machine> -d <database name which you want to connect> -U <username of the database server>
#
#how to do a postgres migration and start with sql?
#https://stackoverflow.com/questions/43839812/#how-to-import-schema-sql-file-to-fresh-new-postgresql-db-9-3-in-lin#ux
#
#psql -f schemadump.sql -p port -U username dbname
