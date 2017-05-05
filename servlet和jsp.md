1. tag library descriptor （TLD，标记类库描述文件） jsp页面可以通过taglib指令访问
	
	> `<%@ taglib uri="/WEB-INF/tlds/wenjian.tld"%>`
2. tag 文件
	 
	> `<%@ taglib tagdri="WEB-INF/tags/wenjian.tag"%>`

----------

### web.xml（部署描述文件） ###

根文元素 ： web-app（必须小写，XML文件大小写敏感）

	<?xml version="1.0" encoding="UTF-8"?>
	
	<web-app 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns="http://java.sun.com/xml/ns/javaee" 
	xsi:schemaLocation="http://java.sun.com/xml/ns/javaee 
	http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" 
	id="WebApp_ID"
	version="2.5">
  		

	</web-app>

----------
### web.xml文件下所有子元素（所有子元素都是可选的） ###
- servlet/servlet-mapping
- context-param
- filter/filter-mapping
- welcom-file-list
- error-page
- security-constraint
- login-config
- security-role
- session-config
- icon
- display-name
- description
- mime-mapping
- jsp-config
- locale-encoding-mapping-list
- listener
- distributable
- env-entry
- ejb-ref
- ejb-local-ref
- service-ref
- resuource-ref
- resource-env-ref
- massage-destination-ref
- message-destination

----------
  配置servlet

	<servlet>
    <servlet-name>servletName</servlet-name>
    <servlet-class>com.wdk.servletPath</servlet-class>
    </servlet>
	表明在WEB-INF/Classes/com/wdk/servletPath中的servlet有个注册名 servletName
	可以通过注册名引用这个servlet

  定义自定义URL

    </servlet-mapping>
		//引用servlet
      	<servlet-name>servletName</servlet-name>
      	//为其指定路径
		<url-pattern>/servletNamePath</url-pattern>
		//或
		<url-pattern>/servletNamePath/</url-pattern>
		//或
		<url-pattern>/servletNamePath.后缀</url-pattern>
		//三种都是完全匹配模式
    </servlet-mapping>

多映射模式
 
	略

匹配顺序

1. 优先处理完全匹配的
2. 目录映射优先于扩展名映射
3. 对于重复路径映射，越长的路径越优先匹配

jsp配置和映射
     
	<servlet>
       	<servlet-name>jsp名称</servlet-name>
       	<jsp-file>jsp路径</jsp-file>
    </servlet>
    <servlet-mapping>
    	<servlet-name>jsp名称</servlet-name>
        <url-pattern>访问路径</url-pattern>
    </servlet-mapping>
  