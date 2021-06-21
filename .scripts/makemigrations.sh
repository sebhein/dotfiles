#!/bin/bash

APP=$1
MONOREPO=~/repos

# Create a package
$MONOREPO/pants package src/python/$APP::

# Run migrations
migrations=$($MONOREPO/dist/src.python.$APP/$APP.pex makemigrations)

echo "$migrations"
# Exit if there are no migrations
if [[ $migrations == "No changes detected" ]]
then
  exit 0
fi

# Extract the paths to files
migration_files=$(echo "$migrations" | grep "/home" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

# Move files to our directory
while IFS= read -r line; do
  from=$line
  to=$(echo $line | sed 's/.*\/clofo/\/home\/ubuntu\/repos\/src\/python/')
  mv $from $to
done <<< "$migration_files"

