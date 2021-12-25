#!/bin/sh
ReStart_Time=20s  #等待多少秒后重启要加时间单位
jvm_ram_xms="512M"  #设置最小内存
jvm_ram_xmx="1024M"  #设置最小内存
jar_name=""  #开服核心的名字记得加.jar后缀名
server_name="testmc"  #服务名(方便维护用的)，比如说是生存服就将testmc改为生存服
echo ""
echo "你可以在下面的链接查看其他的启动脚本"
echo "https://github.com/stevei5mc/McStartServer"
echo ""
echo "服务器已开启"
echo ""
echo "------------------------------------------------------------------------------------------------------------------------"
echo "服务器信息"
echo ""
echo "[$server_name]"
echo "最小内存[$jvm_ram_xms]最大内存[$jvm_ram_xmx]"
echo ""
echo "------------------------------------------------------------------------------------------------------------------------"
echo ""
java -Xms$jvm_ram_xms -Xmx$jvm_ram_xmx -jar $jar_name
echo ""
echo "服务器已关闭"
echo ""
echo "------------------------------------------------------------------------------------------------------------------------"
echo ""
echo "服务器异常或被手动关闭等待关闭"
echo "服务器将在$ReStart_Time后重启,按Ctrl+c关闭"
echo "[$server_name]"
echo ""
echo "------------------------------------------------------------------------------------------------------------------------"
sleep $ReStart_Time
echo ""
sh ./start2.sh
#注意! 如果你将start2.sh改为server.sh，那么 sh ./start2.sh 也要改为 sh ./server.sh