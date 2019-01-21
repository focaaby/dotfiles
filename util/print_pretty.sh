#!/bin/bash

success () {
    printf -- "\033[32m %s\033[0m\n" "$1";
}

warning () {
    printf -- "\033[33m %s\033[0m\n" "$1";
}

error () {
  printf -- "\033[31m %s\033[0m\n" "$1";
  exit
}
