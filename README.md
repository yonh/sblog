# sblog
一个使用org文档生成html的静态博客镜像  
可访问[这里](http://sb-yonh.alaudacn.me/)查看demo  
# 如何使用
**1.下载镜像**  
docker pull outindex.alauda.cn/yonh/sblog

**2.配置你的git库**  
使用github等git代码托管的网站创建一个库，获取其地址，如https://github.com/yonh/sblog    

**3.git库的一些约定**  
该库需要一个org文件夹，存放生成文章的org文件，  
必须要有一个index.org，该文件会生成网站的首页，用于链接到其他文章  
index.org的示例  

    #+OPTIONS: \n:t
    #+STYLE: <link rel="stylesheet" type="text/css" href="style.css" />
    * 我的文章
      [[../a/test1][测试链接1]]
      [[../a/test2][测试链接2]]
 根据index.org的内容
 网站的首页会显示2个链接，分别是测试链接1，测试链接2   
 他们的内容分别由test1.org和test2.org生成  
 上述git库的结构为：  
 -org     
 |- index.org  *首页*   
 |- test1.org  *文章test1*  
 |- test2.org  *文章test2*
 
# 启动
运行时指定环境变量  
**git_src: 你的git库的url** 如：https://github.com/yonh/sblog  

**git_src_dir: /git/[git名称]** 如：/git/sblog, 此名称需要和url上的项目对应  

	docker run -d \
  	-e git_url=https://github.com/yonh/sblog \
  	-e git_src_dir=/git/sblog -p 8888:80 \
  	index.alauda.cn/yonh/sblog
你需要在运行的时候指定你自己的git库地址到环境变量git_url和git_src_dir=/git/你的库名  
你可以使用http://localhost:8888访问博客  
# 更新博客
更新blog流程
1. 编写org文件
2. 将该文件的链接添加到index.org
3. push代码到github
4. 访问http://localhost:8888/update更新博客
# 使用到的技术
emacs,docker,ruby(sinatra),css

