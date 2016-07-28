# 简易聊天室 #
## 简介 ##
这是一个关于一个具有多人在线实时聊天的简单聊天室。主要通过客户端请求服务器响应的方式来实现功能，不需要使用数据库。

主要用到相关技术和语言:


1.  jsp
2.  java 嵌入于jsp中
3.  html5、css、javascript(jQuery)嵌入于jsp中
4.  使用了Ajax来实现网页实现异步更新(聊天页面)
5.  服务器使用了Tomcat v7.0

## 文件目录结构介绍  ![](http://i.imgur.com/WMye9F1.jpg)
开发的主目录在WebContent下：

1. AjaxTest与项目无关，仅仅为在使用Ajax之前做测试。
2. back是开发的主要目录，包括聊天主界面的前端设计和后端数据处理全部包括在这里（以do_xxx.jsp的格式）。
3. pages仅仅包括了header.jsp 是登录界面的header部分。
4. index.jsp（登录界面）、images(logo)、js(jquery)

## 页面功能展示 ##
### 登录界面 ###
![login](http://i.imgur.com/3gnIZPe.gif)



- 登录界面只要求用户名，没有要求密码。当鼠标点击text文本框以外的区域会显示提示。
- 这里简单做了一下逻辑判断，当该用户名（如：gif图片中的aa，ps：我事先已经登录了aa）已经登录聊天室时，用户无法继续使用该用户名登录（这里直接把进入按钮disabled了一下）。

### 聊天室界面 
![](http://i.imgur.com/IlNLwVr.gif)

- 聊天室界面左边是聊天窗口
- 右边是用户窗口
- 下面发送消息窗口