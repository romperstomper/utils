if [ -p thefifo ];then
    rm -f thefifo
fi
mkfifo thefifo

while true;do sh -c "$(cat testfifo)";done
