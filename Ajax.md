### 一 、 AJAX = Asynchronous JavaScript and XML（异步的 JavaScript 和 XML）。 ###

XMLHttpRequest是ajax的基础 

XMLHttpRequest对象，用于正在后台与服务器交换数据，不重新加载整个网页的情况下，对网页进行部分更新。所有浏览器均支持（IE7+ 开始支持，IE5、IE6使用ActiveXObject）

1. 创建XMLHttpRequest对象（JS代码）
	
	    var xmlhttp;
    	if (window.XMLHttpRequest)
    	  {// code for IE7+, Firefox, Chrome, Opera, Safari
    	  xmlhttp=new XMLHttpRequest();
    	  }
    	else
    	  {// code for IE6, IE5
    	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    	  }
2. 向服务器发送请求 
    
     	xmlhttp.open(method,url,async)
    	method:请求类型 GET/POST
    	url:文件在服务器上的位置（注：为了解决得到浏览器的缓存结果，在URL后加时间戳）
    	async:	TRUE或FALSE 默认TRUE异步
		
		xmlhttp.open(String)；
		将请求发送到服务器
		String:仅用于POST请求，用于传递参数。
		xmlHttp.send("user="+username+"&pwd="+password)；
		发送用户名/密码信息。

		使用send方法传递参数使用的是POST方法，需要设定Content-Type头信息，模拟HTTP POST方法发送一个表单，这样服务器才会知道如何处理上传的内容。		
		设置请求头
		xmlHttp.setRequestHeder("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
    
3. 为XMLHttpRequest对象添加onreadystatechange响应函数
		
 - 该 事件处理函数 由 **服务器触发**，并不是用户。
 -  在AJAX执行过过程中，服务器会通知客户端当前的通信状态。依靠更新XMLHtttpRequset对象的readyState来实现。
 -  **改变readyState属性是服务器对客户端连接操作的一种方式，每次readyState属性的改变都会触发readyStatechange事件**
 
 		- **readyState**  属性表示 ajax请求的当前状态。
 			-  0 代表 未初始化。 还没有调用 open方法
 			-  1 代表 正在加载。 open方法以备调用，但send方法未被调用。
 			-  2 代表 已加载完成。 send方法被调用，请求已经开始
 			-  3 代表 交互中。   服务器正在发送相应（Response）
 			-  4 代表 完成。 Response 发送完成。
 		-  每次readyState值得改变，都会触发 onreadyStatechange 事件。如果把onreadystatechange事件处理函数赋给一个函数，那么每次readyState值的改变都会引发该函数的执行。
 	
		-  readyState值得变化以为浏览器的不用有所差异。但，请求结束的值同意为 4。
 		-  **status** 属性 返回服务器状态码
 			-  （用于成功判断） 200：服务器响应正常。
 			-  （用于成功判断） 304：该资源在上次请求之后没有任何修改（这通常用于浏览器的缓存机制，使用GET请求时尤其需要注意）。
 			-   400：无法找到请求的资源。
 			-    401：访问资源的权限不够。
 			-    403：没有权限访问资源。
 			-    404：需要访问的资源不存在。
 			-    405：需要访问的资源被禁止。
 			-    407：访问的资源需要代理身份验证。
 			-    414：请求的URL太长。
 			-    500：服务器内部错误
 - ASYNC
 		- TRUE 默认
 		
			    xmlhttp.onreadystatechange=function()
    			{
    			if (xmlhttp.readyState==4 && xmlhttp.status==200)
    			{
    			document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    			}
    			}
    			xmlhttp.open("GET","/try/ajax/ajax_info.txt",true);
    			xmlhttp.send();
		
		- FALSE

			    不推荐使用 async=false，但是对于一些小型的请求，也是可以的。
    			JavaScript 会等到服务器响应就绪才继续执行。如果服务器繁忙或缓慢，应用程序会挂起或停止。
    			注意：当 async=false 时，不要编写 onreadystatechange 函数 
				把代码放到 send() 语句后面即可：
    			
    			xmlhttp.open("GET","/try/ajax/ajax_info.txt",false);
    			xmlhttp.send();
    			document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    
4. AJAX 服务器 响应
  
	- 获取服务器的响应。XMLHttpRequest对象的 responseTest或responseXML属性
		-  responseTest 获得String形式的响应数据
		
				xmlhttp.responseText;

		-  responseXML  获得XML形式的响应数据
			
				xmlhttp.responseXML;


----------

**$(function(){}) 是 $(document).ready(function(){}) 的简写**


### jQuery AJAX ###

  一， $.ajax，这个是JQuery对ajax封装的最基础步，通过使用这个函数可以完成异步通讯的所有功能。也就是说什么情况下我们都可以通过此方法进行异步刷新的操作。但是它的参数较多，有的时候可能会麻烦一些。看一下常用的参数： 
     
     var configObj = {
       method   //数据的提交方式：get和post
       url   //数据的提交路劲
       async   //是否支持异步刷新，默认是true
       data//需要提交的数据
       dataType   //服务器返回数据的类型，例如xml,String,Json等
       success//请求成功后的回调函数
       error   //请求失败后的回调函数
    }
 
$.ajax(configObj);//通过$.ajax函数进行调用。
 
 好，看一个实际的例子吧，看一个进行异步删除的例子：
    
    [javascript] view plain copy print?在CODE上查看代码片派生到我的代码片
    <span style="font-size:18px;">  // 删除  
    $.ajax({  
    type : "POST",  //提交方式  
    url : "${pageContext.request.contextPath}/org/doDelete.action",//路径  
    data : {  
    "org.id" : "${org.id}"  
    },//数据，这里使用的是Json格式进行传输  
    success : function(result) {//返回数据根据结果进行相应的处理  
    if ( result.success ) {  
    $("#tipMsg").text("删除数据成功");  
    tree.deleteItem("${org.id}", true);  
    } else {  
    $("#tipMsg").text("删除数据失败");  
    }  
    }  
    });  
    </span>  

 二，$.post，这个函数其实就是对$.ajax进行了更进一步的封装，减少了参数，简化了操作，但是运用的范围更小了。$.post简化了数据提交方式，只能采用POST方式提交。只能是异步访问服务器，不能同步访问，不能进行错误处理。在满足这些情况下，我们可以使用这个函数来方便我们的编程，它的主要几个参数，像method，async等进行了默认设置，我们不可以改变的。例子不再介绍。

- url:发送请求地址。
- data:待发送 Key/value 参数。
- callback:发送成功时回调函数。
- type:返回内容格式，xml, html, script, json, text,_default。
 
三，$.get，和$.post一样，这个函数是对get方法的提交数据进行封装，只能使用在get提交数据解决异步刷新的方式上，使用方式和上边的也差不多。这里不再演示。
 
四， $.getJSON，这个是进一步的封装，也就是对返回数据类型为Json进行操作。里边就三个参数，需要我们设置，非常简单：url,[data],[callback]。
 
其实会了$.ajax方法，其它的就都会使用了，都是一样的，其实非常简单。
 
但是这里还有一个问题，比较麻烦，就是如果页面数据量比较大，该怎么办呢？在常规表单的处理中，我们使用框架Struts2可以通过域驱动模式进行自动获取封装，那么通过ajax,如何进行封装呢？这里JQuery有一个插件，Jquery Form，通过引入此js文件，我们可以模仿表单Form来支持Struts2的域驱动模式，进行自动数据的封装。用法和$.ajax类似，看一下实际的例子，这里写一个保存用户的前台代码：
 
    [javascript] view plain copy print?在CODE上查看代码片派生到我的代码片
    <span style="font-size:18px;">  $(function(){  
    var options = {  
    beforeSubmit : function() {//处理以前需要做的功能  
    $("tipMsg").text("数据正在保存，请稍候...");  
    $("#insertBtn").attr("disabled", true);  
    },  
    success : function(result) {//返回成功以后需要的回调函数  
    if ( result.success ) {  
    $("#tipMsg").text("机构保存成功");  
      
       //这里是对应的一棵树，后边会介绍到，  
    // 控制树形组件，增加新的节点  
    var tree = window.parent.treeFrame.tree;  
    tree.insertNewChild("${org.id}", result.id, result.name);  
    } else {  
    $("#tipMsg").text("机构保存失败");  
    }  
    // 启用保存按钮  
    $("#insertBtn").attr("disabled", false);  
    },  
    clearForm : true  
    };  
      
    $('#orgForm').ajaxForm(options); //通过Jquery.Form中的ajaxForm方法进行提交  
    });  
    </span>  


 