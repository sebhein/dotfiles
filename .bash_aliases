# Monorepo aliases
monorepo=""
alias fmt='$monorepo/pants --changed-since=master fmt'
alias lint='$monorepo/pants --changed-since=master lint'
alias prr='bash ~/.scripts/random_reviewer.sh'
function package {
  $monorepo/pants package src/python/$1::
}
function migrate {
  package $1
  $monorepo/dist/src.python.$1/$1.pex migrate
}
function sqlmigrate {
  package $1
  $monorepo/dist/src.python.$1/$1.pex sqlmigrate $2 $3
}
function showmigrations {
  package $1
  $monorepo/dist/src.python.$1/$1.pex showmigrations
}
function makemigrations {
  bash ~/.scripts/makemigrations.sh $1
}
