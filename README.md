# special-memory
Testing environment for databases

When connecting to the db server
```bash
# for easier use of sqlcmd
export PATH="/opt/mssql-tools/bin:$PATH"
sqlcmd -S localhost -U SA -P "Super@Admin123"
# otherwise the full path is necessary: /opt/mssql-tools/bin/sqlcmd
# for runing a script:
# check with ls -alh if the seed.sql script is in the root directory of the container.
ls -alh
sqlcmd -S localhost -U SA -P "Super@Admin123" -i seed.sql # optionally with the database -d onlineStoreDb

# or you can run the seed.sh script from outside of the container
docker exec -it mssql "bash" seed.sh
 
```
