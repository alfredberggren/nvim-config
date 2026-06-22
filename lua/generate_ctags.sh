#!/bin/bash
ARG_1="$1"

if [ -z $ARG_1 ]; then
  echo "No argument supplied."
  exit 1
fi

# Transform path to cachefile path
CACHE_DIR=~/.cache/ctags/
fp_str="$(echo "$ARG_1" | sed -E "s/\///g").tags"
if [ -e "$CACHE_DIR$fp_str" ] && [ "$2" != "refresh" ]; then
  echo "tags already exist for $ARG_1"
  exit 123
fi

sys_h_arr=($(sed -nE 's/#include <(.+\.h)>.*/\1/p' leap.c | sed ':a;N;$!ba;s/\n/ /g'))

usr_h_arr=($(sed -nE 's/#include \"(.+\.h)\".*/\1/p' leap.c | sed 's/\(.*\)/"\1"/g' | sed ':a;N;$!ba;s/\n/ /g'))

declare -a f_h_arr=($ARG_1)

# TODO: This is hardcoded for now by could be overridden, system include dirs should be resolved in runtime instead.
declare -a STD_SYS_DIRS=("/usr/include/" "/usr/local/include/")

for str in "${sys_h_arr[@]}"; do
  for str2 in "${STD_SYS_DIRS[@]}"; do
    if [ -e $str2$str ]; then
      f_h_arr+=("$str2$str")
    fi
  done
done

# TODO: get usr dirs

path_str=""
for str in "${f_h_arr[@]}"; do
  path_str+="$str "
done

ctags -f $CACHE_DIR$fp_str --c-kinds=+p $path_str
[ $? -eq 0 ] || exit 1
