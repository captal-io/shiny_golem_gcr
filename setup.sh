#!/bin/bash
# rc-update add docker boot
source .env
export VERSION="latest"
export IMAGE_NAME="shiny"
export IMAGE_NAME_TEST="shiny_test"

printf "\n\n\t\tSelect one of the following options:\n\n"
printf "\t1. Build\n"
printf "\t2. Deploy\n"
printf "\n\t\t~ "
read opt

if [ $opt == 1 ]
then
    echo; echo "building image..."; echo
    # https://stackoverflow.com/questions/42494853/standard-init-linux-go178-exec-user-process-caused-exec-format-error
    # docker build -t $IMAGE_NAME -f docker-production/Dockerfile .|| exit 1
    sudo docker build -t $IMAGE_NAME_TEST -f Dockerfile .
    sudo docker build --platform=linux/amd64 -t $IMAGE_NAME -f Dockerfile .

elif [ $opt == 2 ]
then
    echo; echo "setting the gcp image tag to the newly built one..."
    docker tag $IMAGE_NAME:$VERSION $GCR/$IMAGE_NAME:$VERSION

    echo; echo "pushing the image to GCR."
    docker push $GCR/$IMAGE_NAME:$VERSION
else
    printf "Try again"
fi