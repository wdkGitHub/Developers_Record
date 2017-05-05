# Blog 搭建过程 #
## 安装 Hexo ##
### 安装前提 ### 
- 必备软件
> git
> node.js

- Hexo安装
> $ npm install -g hexo-cli

### 建站 ###
- 初始化操作

    	$ hexo init <folder>
    	$ cd <folder>
    	$ npm install
		npm 源更改为国内的数据源
		npm config set registry https://registry.npm.taobao.org
- 配置
>参考  [https://hexo.io/zh-cn/docs/configuration.html](https://hexo.io/zh-cn/docs/configuration.html)
- 命令
   - $ hexo generate 
生成静态文件。
    		选项	描述
    		-d, --deploy	文件生成后立即部署网站
    		-w, --watch	监视文件变动
    		该命令可以简写为
    		$ hexo g
   - $ hexo server
启动服务器。默认情况下，访问网址为： http://localhost:4000/。

			选项	描述
			-p, --port	重设端口
			-s, --static	只使用静态文件
			-l, --log	启动日记记录，使用覆盖记录格式
   - $ hexo deploy
部署网站。

    		参数	描述
    		-g, --generate	部署之前预先生成静态文件
    		该命令可以简写为：
    		$ hexo d
   - 其他命令参考 [https://hexo.io/zh-cn/docs/commands.html](https://hexo.io/zh-cn/docs/commands.html)
### 配置主题 ###
**使用next主题**
主题文档地址:[http://theme-next.iissnan.com/getting-started.html#clone](http://theme-next.iissnan.com/getting-started.html#clone)

