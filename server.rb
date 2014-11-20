require "sinatra"
require "json"
require "pry"

set :public_folder, File.dirname(__FILE__) + '/public'

team_file = File.read('roster.json')
teams = JSON.parse(team_file)

team_name_hash = {}
get '/' do 
	@teams = team_name_hash
	erb :index
end

teams.keys.each do |team|
	team_name_hash[team] = team.downcase.split(' ').join('_')
end

get '/*' do |link|
	team_name_hash.values
	@team_name = teams.keys[team_name_hash.values.index(link)]
	@team_roster = teams.values[team_name_hash.values.index(link)]
	erb :teams
end






