HOST="127.0.0.1"
PORT="9000"

while true; do
    read -p ">>> " message

    if [[ "$message" == "q" ]]; then
        echo "Shutting down client..."
        break
    fi

    # Send message to server
    echo "$message" | nc $HOST $PORT
done
