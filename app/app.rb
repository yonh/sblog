# -*- coding: utf-8 -*-
require 'sinatra'

class App < Sinatra::Application
	get '/' do
	  	IO.read('/opt/org/html/index.html')
	end
	get '/:id' do
		IO.read("/opt/org/html/#{params['id']}.html")
	end
end
