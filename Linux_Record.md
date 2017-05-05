# Linux Record（记录）#

> \# 代表root用户，普通用户为 $

### 关机注销 ###
    shutdown [options] when [message]
    
    options:　
			-r 表示重启
			-h表示系统服务停滞(halt)后，立刻关机 
			-f表示快速重启
    
    when：　
			为shutdown指定时间。	
    	    hh:mm：绝对时间，hh指小时，mm指分钟；
			now=+0 立即执行

	例子：
	shutdown -h now 立刻关机
	shutdown -h 21:30 今天21：30关机
	shutdown -h +10 十分钟
	shutdown -r now 立刻重启
	shutdown -r +10 ‘the system will reboot’
          10分钟后重启，管理员提示用户系统要重启了，便于用户保存工作中的资料。只有root用户才能执行