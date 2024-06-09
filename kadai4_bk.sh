#!/bin/bash

# 引数の数をチェック
if [ $# -ne 2 ]; then
  echo "ERROR:input 2 argments" 1>&2
  exit 1
fi

# 引数の数字チェック
expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2 ]; then
  echo "ERROR:input natural number" 1>&2
  exit 1
fi

# 引数1が0かどうかチェック
if [[ "$1" == 0 ]]; then
  echo "ERROR:input1 is 0" 1>&2
  exit 1
fi

# 引数2が0かどうかチェック
if [[ "$2" == 0 ]]; then
  echo "ERROR:input2 is 0" 1>&2
  exit 1
fi

# 引数が自然数かどうかを判定する
#   引数1
if [[ "$1" =~ ^[0-9]+$ ]]; then
  :
else
  echo "ERROR:input1 is not natural number" 1>&2
  exit 1
fi

#   引数2
if [[ "$2" =~ ^[0-9]+$ ]]; then
  :
else
  echo "ERROR:input2 is not natural number" 1>&2
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


