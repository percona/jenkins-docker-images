#!/bin/bash
#
help(){
  echo "Usage: $(basename $0) --build | --clean-images | --erase-all-images | --clean-instances | --erase-all-instances"
  echo "Where options are:"
  echo "--build - build all images from Dockerfiles"
  echo "--clean-images - clean orphaned images (marked with <none>)"
  echo "--erase-all-images - use it if you need to recreate images from scratch"
  echo "--clean-instances - remove stopped but not deleted instances"
  echo "--erase-all-instances - stop and remove all instances"
}
#
if [ $# -lt 1 ]; then
  echo "Too few options, please see help below"
  help
  exit 1
fi
#
BUILD=no
CLEAN_IMAGES=no
ERASE_ALL_IMAGES=no
CLEAN_INSTANCES=no
ERASE_ALL_INSTANCES=no
#
while [ $# -gt 0 ]; do
  case $1 in
    --build)
      export BUILD=yes
      shift
      ;;
    --clean-images)
      shift
      export CLEAN_IMAGES=yes
      shift
      ;;
    --erase-all-images)
      export ERASE_ALL_IMAGES=yes
      shift
      ;;
    --clean-instances)
      export CLEAN_INSTANCES=yes
      shift
      ;;
    --erase-all-instances)
      shift
      export ERASE_ALL_INSTANCES=yes
      ;;
    *)
      echo "Wrong option $1"
      help
      exit 1
      ;;
  esac
done
#
if [ x${BUILD} = xyes ]; then
  cd $(dirname $0)
  for _os in *-x64; do
    docker build -t percona/${_os} ${_os}
  done
fi
#
if [ x${CLEAN_IMAGES} = xyes ]; then 
  ORPHANED=$(docker images | grep none | awk '{printf " "$3}')
  if [ -z "${ORPHANED}" ]; then
    echo "No images to clean"
  else
  docker rmi ${ORPHANED}
  fi
fi
#
if [ x${ERASE_ALL_IMAGES} = xyes ]; then
  docker images | grep -v IMAGE | awk '{printf " "$3}' | xargs docker rmi
  docker images -a | awk '{printf " "$3}' | xargs docker rmi
fi
#
if [ x${CLEAN_INSTANCES} = xyes ]; then
  STOPPED=$(docker ps -a | grep Exited | awk '{printf " "$1}')
  if [ -z "${STOPPED}" ]; then
    echo "No instances to clean"
  else
    docker rm ${STOPPED}
  fi
fi
#
if [ x${ERASE_ALL_INSTANCES} = xyes ]; then
  INSTANCES=$(docker ps -a | grep -v CONTAINER | awk '{printf " "$1}')
  if [ -z "${INSTANCES}" ]; then
    echo "No instances to erase"
  else
    docker stop ${INSTANCES}
    docker rm ${INSTANCES}
  fi
fi
#
# To be continued
