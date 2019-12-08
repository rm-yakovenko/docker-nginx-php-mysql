#!/bin/bash

set -e

if [ $CONTAINER_USER ];
then
  chown --dereference app "/proc/$$/fd/1" "/proc/$$/fd/2"
  usermod -u $CONTAINER_USER app
fi

exec gosu app $@