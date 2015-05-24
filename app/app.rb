# -*- coding: utf-8 -*-
require 'sinatra'

class App < Sinatra::Application
  def replace_header(text)
    text.force_encoding('utf-8')
    #替换索引文字
    text = text.gsub("<h2>Table of Contents</h2>",'<h2><a href="">索引</a></h2>')
    # 添加返回首页
    text.gsub('<h1 class="title">','<h1 class="title"><a class="return" href="/">返回首页</a>')
  end
  
  get '/' do
    text = IO.read('/opt/org/html/index.html')
    replace_header(text)
  end
  get '/a/:id' do
    text = IO.read("/opt/org/html/#{params['id']}.html")
    replace_header(text)
  end
  get '/style' do
    IO.read("/opt/webapp/public/style.css")
  end
  get '/update' do
    `/opt/git_pull.sh`
  end
end
