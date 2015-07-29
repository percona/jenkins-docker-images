#!/bin/bash
for _os in *-x64; do
  docker build -t percona/${_os} ${_os}
done
