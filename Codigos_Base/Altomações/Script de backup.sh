mysqldump -u usuario -p'senha' --all-databases | gzip > /backup/mariadb_$(date +%F).sql.gz
#Script de backup automático com cron: