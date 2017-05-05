

----------

###1.配置git的user  name和email ###

1. $ git config --global user.name "用户名"
2. $ git config --global user.email "邮箱"

### 2.生成SSH秘钥 ###
1. ssh-keygen -t rsa -C "邮箱"
2. 连按三次回车，默认存放路径，密码不设置

### 3.将生成的公钥（id_rsa.pub） 添加到GitHub ###
### 4.连接测试 ###
1.$ssh git@github.com 



----------


		$ git init        
        $ git add -all        //添加该文件夹下的所有文件
       	$ git commit -m ‘这是一个示例’   //引号内是对仓库的描述
        $ git remote add origin git@github.com:xxx/yyy.git  
		//添加远程仓库路径（ssh路径或者http路径）
        $ git push -u origin master（第一次推送全部文件）
		$ git push origin master（推送最新的）
		
		$ git pull 拉取远程仓库数据 并进行分支数据同步




----------
修改后进行单独 commit

	$ git commit 文件 -m "注释"

删除一个文件

	$ git rm 文件 -rf

----------

1. 创建仓库 `git  init `
2. 检出仓库 
 - 本地仓库  `git clone /path/to/repository`
 - 远程服务器上的仓库  `git clone username@host:/path/to/repository`



----------
### git log 乱码解决 ###

.gitconfig文件

添加

	[gui]

       encoding = utf-8

	[i18n]

      commitencoding = gbk

	[svn]

     pathnameencoding = gbk

http://blog.csdn.net/u013485584/article/details/53018411


----------
### git忽略文件设置 ###

本地仓库设置
 
- 在.git文件夹中设置
- 在../.git/info文件夹 中的exclude文件中设置
- 在../.git 文件夹中的 config 文件中添加

		[core]
			excluderfile=../.git/exclude



全局仓库设置

- 建立 .gitignore 全局忽略文件
		
		cat> .gitignore<<EOF
	    >忽略文件
	    >EOF 结束
- 在全局.config文件中添加

		[core]
			excluderfile=../path/.gitignore
- .gitignore 文件存放位置要求
>存放位任何位置 细节** 略**


----------






		