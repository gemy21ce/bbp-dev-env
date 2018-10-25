#!/usr/bin/env bash

echo "Docker, Maven and Git are required, please make sure that they are installed and available via terminal"
echo "If any of those are not installer please install them then try again"
echo ""
read -r -p "Continue? [Y/n]:" con
echo

case "$con" in
    Y)
        mkdir gamal_dawood
        pushd gamal_dawood
        git clone git@github.com:gemy21ce/bbp-dev-env.git dev-env
        echo ""
        git clone git@github.com:gemy21ce/bbp-server1.git server1
        echo ""
        git clone git@github.com:gemy21ce/bbp-server2.git server2
        echo ""
        pushd server1
        mvn clean package docker:build
        popd
        pushd server2
        mvn clean package docker:build
        popd
        pushd dev-env
        docker-compose up
        ;;
    *)
        ;;
esac