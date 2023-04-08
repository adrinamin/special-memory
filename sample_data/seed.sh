#!/bin/bash

export PATH="/opt/mssql-tools/bin:$PATH"
sqlcmd -S localhost -U SA -P "Super@Admin123" -i seed.sql