SELECT
    t.name AS TableName,
    p.rows AS [RowsCount],
    MAX(ius.last_user_update) AS LastInsertOrUpdate
FROM sys.tables t
JOIN sys.partitions p
    ON t.object_id = p.object_id AND p.index_id IN (0,1)
LEFT JOIN sys.dm_db_index_usage_stats ius
    ON t.object_id = ius.object_id
    AND ius.database_id = DB_ID()
GROUP BY t.name, p.rows
ORDER BY LastInsertOrUpdate DESC;
