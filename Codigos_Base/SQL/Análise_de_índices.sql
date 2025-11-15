SELECT table_name, index_name, seq_in_index, column_name
FROM information_schema.statistics
WHERE table_schema = 'seu_banco';