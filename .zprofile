alias -s app=open -a

# Regiter Aliases to MacApps
function app_alias() {
  local app aliasname target

  for app in $1/*.app(N); do
    # remove all leading pathname, remove filename extention, and remove all spaces
    aliasname=${app:t:r:gs/ //}
    # escape all spaces
    target=${app:gs/ /\\ /}

    alias $aliasname=$target
  done
}

() {
  local dir subdir

  for dir in $@; do
    app_alias $dir

    for subdir in $dir/^*.app(/N); do
      app_alias $subdir
    done
  done
} {/Applications,~/Applications}
