if [ ! -p testfifo ]; then
    mkfifo testfifo
fi

while true; do
    sh -c "$(cat testfifo)"
done
