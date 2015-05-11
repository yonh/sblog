# -*- coding: utf-8 -*-
require 'sinatra'

class App < Sinatra::Application
	get '/' do
	  	IO.read('../org/html/index.html')
	end
	get '/:id' do
		IO.read("../org/html/#{params['id']}.html")
	end
end
