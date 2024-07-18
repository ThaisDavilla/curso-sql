-- Como fazer BACKUP e RESTORE com MYSQLDUMP

-- Todo o banco
MYSQLDUMP -u -p senha se não tiver senha não usar -p root nome do banco de dados

-- Apenas a estrutura
MYSQLDUMP -u root --no-data nome do banco de dados

-- Apenas os dados
MYSQLDUMP -u root --no-create-info nome do banco de dados
