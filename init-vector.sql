-- Включаем расширение pgvector
CREATE EXTENSION IF NOT EXISTS vector;

-- Настройки для лучшей производительности векторов
ALTER SYSTEM SET shared_preload_libraries = 'vector';
ALTER SYSTEM SET max_connections = 200;
ALTER SYSTEM SET shared_buffers = '1GB';
ALTER SYSTEM SET work_mem = '50MB';

-- Перезагрузите конфигурацию
SELECT pg_reload_conf();