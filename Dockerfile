# Version 0.0.2
# build
# sudo docker build -t yonh/sblog
# run
# sudo docker run -d --name sblog -p 4508:80 yonh/sblog
# sudo docker run -it --rm -p 4508:80 yonh/blog
# sudo docker run -it --rm -p 4508:80 -v ~/git/sblog/app:/opt/webapp yonh/sblog
# sudo docker run -d --name sblog -p 4508:80 -v ~/git/sblog/app:/opt/webapp yonh/sblog

FROM ubuntu:14.04

#镜像作者和email
MAINTAINER yonh "azssjli@163.com"
ENV REFERSHED_AT 2015-05-07

#执行命令，docker会在每条run指令后创建一个新的镜像层
#使用官方源实在是太慢了，下载软件还会失败，更改阿里源作替换
#ADD sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install ruby ruby-dev make g++ emacs
#移除官方源
#RUN gem sources --remove https://rubygems.org/
#增加http://ruby.taobao.org/源
#RUN gem sources -a https://ruby.taobao.org/
RUN gem install --no-rdoc --no-ri sinatra rqrcode_png thin
#RUN sed -i "s/:DoNotReverseLookup => nil/:DoNotReverseLookup=> true/g" /usr/lib/ruby/1.9.1/webrick/config.rb
ADD app /opt/webapp/
ADD org /opt/org/
RUN mkdir -p /opt/webapp

#公开端口
EXPOSE 80

CMD [ "/opt/webapp/run.sh" ]
