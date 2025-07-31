#!/usr/bin/env bash

die() {
  message=$1
  echo "$message" >&2
  exit 1
}

git_get_tags() {
  local url=$1
  if git --version &>/dev/null; then
    git ls-remote --tags $url
  else
    die "'git' required."
  fi
}

git_address() {
  echo 'https://github.com/GothenburgBitFactory/taskwarrior.git'
}

get_available_releases() {
  git_get_tags $(git_address) | \
    grep -v '{}$' | \
    grep 'refs/tags/v' | \
    cut -d/ -f3 | \
    cut --delimiter v -f2
}

git_clone() {
  local version=$1
  local path=$2

  if git --version &>/dev/null; then
    git clone $(git_address) -b "v$version" "$path"
  else
    die "'git' required."
  fi
}


platform() {
  local uname=$(uname -s)
  if [ "$uname" = "Darwin" ]; then
    echo $uname
  elif [ "$uname" = "Linux" ]; then
    echo $uname
  else
    die "Unsupported platform '$uname'."
  fi
}

filename() {
  local version=$1

  echo "task-${version}-$(platform).tar.gz"
}

archname() {
  local uname=$(uname -m)
  if [ "$uname" = "x86_64" ]; then
    echo x86_64
  elif [ "$uname" = "arm64" ]; then
    echo arm64
  else
    die "Unsupported archname '$uname'."
  fi
}
