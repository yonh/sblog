# sblog
一个使用org文档生成html的静态博客镜像  
可访问[这里](http://yonh-sb.daoapp.io/)查看demo  
# 如何使用

**0.使用docker build镜像[可选]
docker build -t yonh/sblog .

**1.下载镜像**  
docker pull outindex.alauda.cn/yonh/sblog

**2.配置你的git库**  
使用github等git代码托管的网站创建一个库，获取其地址，如http://git.oschina.net/yonh/obf.git    

**3.git库的一些约定**  
该库需要一个org文件夹，存放生成文章的org文件，  
必须要有一个index.org，该文件会生成网站的首页，用于链接到其他文章  
参考：https://orgmode.org/manual/CSS-support.html

index.org的示例  

    #+OPTIONS: \n:t
    #+STYLE: <link rel="stylesheet" type="text/css" href="/style.css" /> [ 废弃 ]
    #+HTML_HEAD: <link rel="stylesheet" type="text/css" href="/style.css" />
    #+HTML_HEAD_EXTRA: <link rel="alternate stylesheet" type="text/css" href="/style.css" />
    * 我的文章
      [[../a/test1][测试链接1]] #a是程序定义,暂时不允许更改,照写就是了
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
**git_src: 你的git库的url** 如：http://git.oschina.net/yonh/obf.git  

	docker run -d \
  -e git_url=https://git.oschina.net/yonh/obf.git \
	-p 8888:80 \
  index.alauda.cn/yonh/sblog
你需要在运行的时候指定你自己的git库地址到环境变量git_url  
如果你使用上述命令运行,你可以使用http://localhost:8888 来访问博客  
这里需要一些docker的知识
# 更新博客
更新blog流程  
1. 编写org文件,头部引入美化页面的style.css  
2. 将该文件的链接添加到index.org  
3. push代码到github  
4. 访问http://localhost:8888/update更新博客  
# 使用到的技术  
emacs,docker,ruby(sinatra),css


# 问题记录
新版emacs使用原来的导致方式失败
```bash
emacs --batch --script ./org2html.el -infile "$1" -outfile ${tmp_file}
> Wrong type argument: commandp, org-export-as-html
解决方法
emacs -l htmlize.el "$1" --batch --eval "(org-html-export-to-html)"
```