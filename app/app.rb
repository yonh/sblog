# -*- coding: utf-8 -*-
require 'sinatra'

class App < Sinatra::Application
	get '/' do
	  html = IO.read('../org/html/linux-notes.html')
	end
end
