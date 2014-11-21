# Patrick Kennedy
# Kickball Challenge
# 11/18/14 (updated 11/20/14)

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

# setting the default page
get '/' do
	@teams = team_name_hash
	@positions = position_arr
	# binding.pry
	erb :index
end

# using the splat
get '/teams/*' do |link|
	team_name_hash.values
	@team_name = teams.keys[team_name_hash.values.index(link)]
	@team_roster = teams.values[team_name_hash.values.index(link)]
	erb :teams
end

# futzing around with params
get '/positions/:link' do
	@teams = teams
	@link = params[:link]
	# binding.pry
	erb :positions
end

# binding.pry