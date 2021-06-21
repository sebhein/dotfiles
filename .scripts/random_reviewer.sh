#!/bin/bash
# Select someone to do a review at random
reviewers=( "Name1" "Name2" )
reviewer=${reviewers[$RANDOM % ${#reviewers[@]}]}
echo $reviewer
