#Patrick Kennedy & Nick Clucas
#Kickball Challenge
#11/18/14

require "sinatra"
require "json"
require "pry"

set :public_folder, File.dirname(__FILE__) + '/public'

team_file = File.read('roster.json')
teams = JSON.parse(team_file)

team_name_hash = {}
position_arr = []

position_arr = teams["Simpson Slammers"].keys

teams.keys.each do |team|
	team_name_hash[team] = team.downcase.split(' ').join('_')
end

get '/' do 
	@teams = team_name_hash
	@positions = position_arr
	binding.pry
	erb :index
end

get '/teams/*' do |link|
	team_name_hash.values
	@team_name = teams.keys[team_name_hash.values.index(link)]
	@team_roster = teams.values[team_name_hash.values.index(link)]
	erb :teams
end

get '/positions/*' do |link|
	position_arr
	@postion = ''		
	@player = ''
	erb :positions
end

#binding.pry




