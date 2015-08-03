#!/bin/bash
for _os in *-x64; do
  docker build --no-cache=true -t percona/${_os} ${_os}
done
