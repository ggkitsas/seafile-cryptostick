#!/bin/sh

git submodule --quiet foreach 'echo $name `git rev-parse --abbrev-ref HEAD`'
