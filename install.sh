#!/usr/bin/env bash

set -euf -o pipefail
umask 077
has_copied=0

for atom in Atom "Atom Beta"; do
  path="/Applications/${atom}.app"
  [ -d "${path}" ] && \
    cp atom-new.icns "${path}/Contents/Resources/atom.icns" && \
    touch "${path}" && \
    has_copied=1
done

[ ${has_copied} = "1" ] && killall Dock