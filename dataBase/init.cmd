@echo off
set Path=%Path%;D:\ITPrograms\PostgrePro\12\bin
psql --username=postgres --dbname=postgres --command="\encoding UTF8" --file=create_db.sql
psql --username=postgres --dbname=auction_db --command="\encoding UTF8" --file=%cd%\create_structure.sql
psql --username=postgres --password --dbname=auction_db -c "\encoding UTF8" --file=%cd%\fill_tables_test.sql
pause
