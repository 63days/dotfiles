docker build -t juil_temp \
    --build-arg USER_NAME=$USER \
    --build-arg PASSWORD=juil \
    --build-arg UID=$UID \
    .
