# -*- coding: utf-8 -*-
require 'sinatra'

class App < Sinatra::Application
  cache = Hash.new
  
  def replace_header(text)
    text.force_encoding('utf-8')
    #替换索引文字
    text = text.gsub("<h2>Table of Contents</h2>",'<h2><a href="">索引</a></h2>')
    # 添加返回首页
    text.gsub('<h1 class="title">','<h1 class="title"><a class="return" href="/">返回首页</a>')
  end
  def read_file(filename)
    text = IO.read("/opt/org/html/#{filename}.html")
    replace_header(text)
  end
  
  get '/' do
    text = cache['/']
    if text == nil then 
      text  = read_file("index")
      cache['/'] = text
    end
    text
  end
  get '/a/:id' do
    text = cache[params['id']]
    if text == nil then 
      text  = read_file(params['id'])
      cache[params['id']] = text
    end
    text
  end
  get '/style' do
    text = cache['/opt/webapp/public/style.css']
    if text == nil then
      text  = IO.read("/opt/webapp/public/style.css")
      cache['/opt/webapp/public/style.css'] = text
    end
    text
  end
  get '/update' do
    cache = Hash.new
    `/opt/git_pull.sh`
  end
end
