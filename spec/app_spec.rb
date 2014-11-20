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
		get '/', {}, 'rack.session' => { :name => 'Prueba' }
		expect(last_response).to be_ok
	end
	it "Sesion iniciada" do
		get '/'
		expect(last_response).to be_ok
	end

	it "post" do
		post '/'
		expect(last_response).to be_ok
	end

	it "post user" do
		post '/' , :username => "Prueba"
		expect(last_response).to be_ok
	end

	it "Cierre de sesion" do
		get '/logout'
		expect(last_response.body).to eq("")
	end

	it "Envio con sesion" do
		get '/send', {}, 'rack.session' => { :name => 'Prueba' }
		expect(last_response.body).to eq("Not an ajax request")
	end

	it "Envio con sesion HTTP_X_REQUESTED_WITH" do
		get '/send', {}, {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest" ,'rack.session' => { :name => 'Prueba' }}
		expect(last_response.body).to eq("")
	end

	it "Envio sin sesion" do
		get '/send',env = {}
		expect(last_response.body).to eq("")
	end

	it "Update" do
		get '/update'
		expect(last_response.body).to eq("Not an ajax request")
	end

	it "Update HTTP_X_REQUESTED_WITH" do
		get '/update',{}, {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"}
		expect(last_response).to be_ok
	end

	it "User" do
		get '/user'
		expect(last_response.body).to eq("Not an ajax request")
	end

	it "User HTTP_X_REQUESTED_WITH" do
		get '/user',{}, {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"}
		expect(last_response).to be_ok
	end

	it "chat update" do
		get '/chat/update'
		expect(last_response.body).to eq("Not an ajax request")
	end

	it "chat update HTTP_X_REQUESTED_WITH" do
		get '/chat/update',{}, {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"}
		expect(last_response).to be_ok
	end
end