#!/bin/bash

tmp=/tmp/$$

ERROR_EXIT () {
  echo $1 >&2
  rm -f $tmp-*
  exit 1
}

# エラーケース
# test1:引数の数エラー（引数1個）
#   期待値 ERROR:input 2 argments
echo "ERROR:input 2 argments" > ${tmp}-ans1
./kadai4.sh 1 > ${tmp}-result1
diff ${tmp}-ans1 ${tmp}-result1 && echo "test1: PASS" || ERROR_EXIT "error in test1"


# test2:引数の数エラー（引数3個）
#   期待値 ERROR:input 2 argments
echo "ERROR:input 2 argments" > ${tmp}-ans2
./kadai4.sh 1 1 1 > ${tmp}-result2
diff ${tmp}-ans2 ${tmp}-result2 && echo "test2: PASS" || ERROR_EXIT "error in test2"

# test3:引数の数字チェックエラー（引数1が文字列"a"）
#   期待値 ERROR:input natural number
echo "ERROR:input natural number" > ${tmp}-ans3
./kadai4.sh a 5 > ${tmp}-result3
diff ${tmp}-ans3 ${tmp}-result3 && echo "test3: PASS" || ERROR_EXIT "error in test3"

# test4:引数の数字チェックエラー（引数2が文字列"b"）
#   期待値 ERROR:input natural number
echo "ERROR:input natural number" > ${tmp}-ans4
./kadai4.sh 1 b > ${tmp}-result4
diff ${tmp}-ans4 ${tmp}-result4 && echo "test4: PASS" || ERROR_EXIT "error in test4"

# test5:引数の0チェックエラー（引数1が0）
#   期待値 ERROR:input1 is 0
echo "ERROR:input1 is 0" > ${tmp}-ans5
./kadai4.sh 0 5 > ${tmp}-result5
diff ${tmp}-ans5 ${tmp}-result5 && echo "test5: PASS" || ERROR_EXIT "error in test5"

# test6:引数の0チェックエラー（引数2が0）
#   期待値 ERROR:input2 is 0
echo "ERROR:input2 is 0" > ${tmp}-ans6
./kadai4.sh 10 0 > ${tmp}-result6
diff ${tmp}-ans6 ${tmp}-result6 && echo "test6: PASS" || ERROR_EXIT "error in test6"

# test7:引数の自然数チェックエラー（引数1が-10）
#  期待値 ERROR:input1 is not natural number 
echo "ERROR:input1 is not natural number" > ${tmp}-ans7
./kadai4.sh -10 5 > ${tmp}-result7
diff ${tmp}-ans7 ${tmp}-result7 && echo "test7: PASS" || ERROR_EXIT "error in test7"

# test8:引数の自然数チェックエラー（引数2が-10）
# 期待値 ERROR:input2 is not natural number
echo "ERROR:input2 is not natural number" > ${tmp}-ans8
./kadai4.sh 1 -10 > ${tmp}-result8
diff ${tmp}-ans8 ${tmp}-result8 && echo "test8: PASS" || ERROR_EXIT "error in test8"

# 正常系のケース
# test9:引数1:10, 引数2:5
# 期待値 5
echo "5" > ${tmp}-ans9
./kadai4.sh 10 5 > ${tmp}-result9
diff ${tmp}-ans9 ${tmp}-result9 && echo "test9: PASS" || ERROR_EXIT "error in test9"


# test10:引数1:5, 引数2:10
# 期待値 5
echo "5" > ${tmp}-ans10
./kadai4.sh 5 10 > ${tmp}-result10
diff ${tmp}-ans10 ${tmp}-result10 && echo "test10: PASS" || ERROR_EXIT "error intest10"

# test11:引数1:10, 引数2:3
# 期待値 1
echo "1" > ${tmp}-ans11
./kadai4.sh 10 3 > ${tmp}-result11
diff ${tmp}-ans11 ${tmp}-result11 && echo "test11: PASS" || ERROR_EXIT "error in test11" 


rm -f ${tmp}-*



