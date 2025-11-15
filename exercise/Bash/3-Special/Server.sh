HOST="127.0.0.1"
PORT="9000"

# Fai partire il Server
echo "Starting server at ${HOST}:${PORT}..."

echo "[+] Welcome to PyServer!"
echo "[+] Type q to shutdown"
echo; 

while true; do
    nc -lk -p ${PORT} | while read line; do 
        if [[ "$line" == "q" ]]; then 
            echo "Shutting down server..."; 
            break 2; 
        fi
        echo ">>> ${line}"; 
    done    
done
