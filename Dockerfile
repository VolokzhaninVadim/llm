FROM postgres:17-bookworm

# Устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    postgresql-server-dev-17 \
    && rm -rf /var/lib/apt/lists/*

# Клонируем и устанавливаем pgvector
RUN git clone https://github.com/pgvector/pgvector.git \
    && cd pgvector \
    && make DISABLE_JIT=1 \
    && make install \
    && cd .. \
    && rm -rf pgvector

# Создаем директорию для скриптов инициализации
RUN mkdir -p /docker-entrypoint-initdb.d

# Копируем скрипт инициализации
COPY init-vector.sql /docker-entrypoint-initdb.d/

EXPOSE 5432

CMD ["postgres"]