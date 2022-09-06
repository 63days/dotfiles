docker build -t juil \
    --build-arg USER_NAME=$USER \
    --build-arg PASSWORD=juil \
    --build-arg UID=$UID \
    .
