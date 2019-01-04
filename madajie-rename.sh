#!/bin/bash
#
# 👧把“喜马拉雅”的超人马大姐全集搞的不能听了，所以要想办法解决
# iExplorer 倒出"喜马拉雅"的缓存
# sqlite3 读取 ting.sqlite
# SELECT title,filePath FROM download_table WHERE artist="伊朵太阳花儿"
# .output result.txt 倒出到文件
#
# 一看这么多文件，手动重命名太累，上脚本把
# 所以就有了这个脚本的诞生
#
# 其间参考：
# #!/bin/bash：https://www.cnblogs.com/Lynn-Zhang/p/5758287.html
# 文本内容遍历：http://www.cnblogs.com/fulucky/p/7975567.html
# 表结构：https://blog.csdn.net/yuxiayiji/article/details/8426280
# 表查询：http://www.w3school.com.cn/sql/sql_select.asp
# 表字段查询：https://blog.csdn.net/chenken789/article/details/80455992
# awk 分割：https://www.cnblogs.com/emanlee/p/3327576.html

DST_PATH="/Users/stone/Desktop/喜马拉雅FM/Documents/iDoc/Download"
RST_PATH="/Users/stone/Desktop/result.txt"

dirs -v
echo "push to $DST_PATH"
pushd $DST_PATH

while read line; do
  title=`echo $line | awk -F "|" '{ print $1 }'`
  name=`echo $line | awk -F "|" '{ print $2 }'`
  echo "find \"$name\" rename to \"$title.mp3\""
  find . -type f -name "*$name*" -exec mv {} "$title.mp3" \;
done < $RST_PATH

popd
dirs -v
