#/bin/bash

DATA=$PWD
set -e
cd $(dirname $0)

function verify_checksums() {
    local version="$1"

    pushd "${version}/files/" > /dev/null
    md5sum --check checksums.txt
    popd
}

function build_image() {
    local version="$1"

    pushd "${version}/" > /dev/null
    docker build . \
        --build-arg "UID=$(id -u)" \
        --build-arg "GID=$(id -g)" \
        --tag "local/petalinux:${version}"
    popd
}

function start_container() {
    local version="$1"
    local data="$2"

    docker run -it --rm --volume "${data}:/data/" --privileged "local/petalinux:${version}"
}

verify_checksums "$1"
build_image "$1"
start_container "$1" "${DATA}"
