#!/bin/bash

set -euo pipefail

PID_FILE="/tmp/myservice.pid"

start_service() {
    if [ -f "$PID_FILE" ]; then
        pid=$(cat "$PID_FILE")

        if [[ "$pid" =~ ^[0-9]+$ ]] && kill -0 "$pid" 2>/dev/null; then
            echo "Уже запущен (PID $pid)"
            return 0
        else
            rm -f "$PID_FILE"
        fi
    fi

    sleep 3600 &
    pid=$!

    echo "$pid" > "$PID_FILE"

    echo "Запущен (PID $pid)"
}

stop_service() {
    if [ ! -f "$PID_FILE" ]; then
        echo "Сервис не запущен"
        return 0
    fi

    pid=$(cat "$PID_FILE")

    if [[ "$pid" =~ ^[0-9]+$ ]] && kill -0 "$pid" 2>/dev/null; then
        kill "$pid"
        rm -f "$PID_FILE"
        echo "Остановлен (PID $pid)"
    else
        rm -f "$PID_FILE"
        echo "Процесс уже не существует, pid-файл удалён"
    fi
}

status_service() {
    if [ ! -f "$PID_FILE" ]; then
        echo "Не работает"
        return 0
    fi

    pid=$(cat "$PID_FILE")

    if [[ "$pid" =~ ^[0-9]+$ ]] && kill -0 "$pid" 2>/dev/null; then
        echo "Работает (PID $pid)"
    else
        echo "Не работает"
    fi
}

help_service() {
    echo "Использование: $0 {start|stop|status|help}"
    echo "start  - запустить сервис"
    echo "stop   - остановить сервис"
    echo "status - проверить состояние"
    echo "help   - показать справку"
}

case "$1" in
    start)
        start_service
        ;;
    stop)
        stop_service
        ;;
    status)
        status_service
        ;;
    help)
        help_service
        ;;
    *)
        echo "Ошибка: неизвестная команда '$1'" >&2
        help_service >&2
        exit 1
        ;;
esac
