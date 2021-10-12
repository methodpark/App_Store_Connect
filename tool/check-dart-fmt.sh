#!/bin/bash

set -e

cd "$(dirname "$0")"

# lib
libFolder="../lib"

command="dart format -o none --set-exit-if-changed $libFolder"

$command

#test
testFolder="../test"

command="dart format -o none --set-exit-if-changed $testFolder"

$command
