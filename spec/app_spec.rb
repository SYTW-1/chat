# -*- coding: utf-8 -*-
require 'coveralls'
Coveralls.wear!
ENV['RACK_ENV'] = 'test'
require_relative '../app.rb'
require 'rack/test'
require 'rubygems'
require 'rspec'

include Rack::Test::Methods
describe "Test APP chat: Comprobacion de funciones" do

	def app
	   Sinatra::Application
	end

	it "No hay sesion iniciada" do
		get '/'
		expect(last_response).to be_ok
	end

	it "post" do
		post '/'
		expect(last_response).to be_ok
	end

	it "post user" do
		post '/' , :username => "Prueba"
		post '/' , :username => "Prueba"
		expect(last_response.body).to eq("")
	end

	it "Cierre de sesion" do
		get '/logout'
		expect(last_response.body).to eq("")
	end

	it "Envio con sesion" do
		get '/send'
		expect(last_response.body).to eq("")
	end

	it "Update" do
		get '/update'
		expect(last_response.body).to eq("Not an ajax request")
		
	end

	it "User" do
		get '/user'
		expect(last_response.body).to eq("Not an ajax request")
	end

	it "chat update" do
		get '/chat/update'
		expect(last_response.body).to eq("Not an ajax request")
	end

end