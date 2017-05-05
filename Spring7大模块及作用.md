# Spring模块 #
![](http://img.my.csdn.net/uploads/201205/27/1338117197_8461.gif)
###核心容器(Spring core) ###
- 提供Spring框架的基本功能.
- spring以bean的方式组织和管理Java应用中的各个组件及关系.
- Spring使用BeanFactory来产生和管理bean,它是工厂模式的实现.
- BeanFactory使用控制反转(IOC)模式将应用配置和依懒性规范与实际的应用程序分开.
- BeanFactory使用依赖注入的方式提供个组件依赖.
 
###Spring上下文(Spring Context) ###
- Spring上下文是一个配置文件,向Spring框架提供上下文信息.
- Spring上下文包括企业服务,如JDDI、EJB、电子邮件、国际化、校验和调度功能。

###Spring面向切面编程(Spring　AOP) ###
- 通过配置管理特性，Spring AOP模块直接将面向方面的编程功能集成到了Spring框架中。所提，可以很苦容易地使用Spring框架管理的任何对象支持AOP。
- Spring AOP 模块为基于Spring的应用程序中的对象提供了事务管理服务。
- 通过使用SpringAOP，不用依赖EJB组件，就可以将声明性事务管理集成到应用程序中。

###Spring DAO模块 ###
- 主要目的是将持久层相关问题与一般的业务规则和工作流隔离开来。
- Spring中的DAO提供一致的方式访问数据库，不管采用任何持久化技术，Spring都提供一致的编程模型。
- Spring还对不同的持久层技术提供一致的DAO方式的异常层次结构。


###Spring ORM模块###
- Spring与所有的主要的ORM映射框架都集成的很好，位置写框架提供了模板之类的辅助类，达成了一致的编程风格。

###Spring Web模块 ###
- Web上下文模块建立在应用程序上下文模块之上，未基于Web的应用程序提供了上下文。
- Web层使用Web层框架，可选的，可以是Spring自己框架的MVC，或Struts等框架。

###Spring MVC框架(Spring Web MVC) ###
- MVC框架是一个全功能的构建Web应用程序的MVC实现。
- 通过策略借口，MVC框架便成为高度可配置的。
- Spring的MVC框架提供清晰的角色划分：控制器、验证器、命令对象、表单对象、模型对象、分发器、处理映射和视图解析器。Spring支持多种视图技术。
