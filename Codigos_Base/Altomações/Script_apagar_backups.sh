find /backup/ -type f -name "*.sql.gz" -mtime +7 -exec rm {} \;
#Script para apagar backups antigos: