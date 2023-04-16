# special-memory

This repository is just my personal playground for working with sql server.
If you find something useful in it, you can use it of course.

When connecting to the db server and starting the interactive sql session:
```bash
# for easier use of sqlcmd, otherwise the full path is necessary: /opt/mssql-tools/bin/sqlcmd
export PATH="/opt/mssql-tools/bin:$PATH"
# starting interactive mode of sql server
sqlcmd -S localhost -U SA -P "Super@Admin123"
```
Or, just seeding the database:
```bash
export PATH="/opt/mssql-tools/bin:$PATH"
sqlcmd -S localhost -U SA -P "Super@Admin123" -i seed.sql # optionally with the database -d onlineStoreDb
```

You can also run the seed.sh script from outside the container if you don't want to exec into the container.
```bash
docker exec -it mssql "bash" seed.sh
```

If you have any ideas for extension or to make it even better, just let me know :).