#!/bin/bash

# 引数の数をチェック
if [ $# -ne 2 ]; then
  echo "input 2 argments" 1>&2
  exit 1
fi

# 引数の数字チェック
expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2 ]; then
  echo "input natural number" 1>&2
  exit 1
fi

# ユークリッドの互除法（再帰）
function gcd() {
  local x=$1;
  local y=$2;
  # 基底条件
  if(($2==0));then
    echo "$x";
  else
    # 再帰
    echo $(gcd $y $(($x % $y)) );
  fi
}

gcd $1 $2 ;
exit ;


