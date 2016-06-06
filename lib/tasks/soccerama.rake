require 'soccerama'

namespace :soccerama do
  @client = Soccerama::Client.new(ENV['SOCCERAMA_KEY'])
  desc 'fetch competitions'
  task competitions: :environment do
    client = Soccerama::Client.new(ENV['SOCCERAMA_KEY'])
    comp = client.competitions
    comp.each do |competition|
      Competition.create do |c|
        c.original_competition_id = competition['id']
        c.name = competition['name']
        c.active = competition['active']
      end
    end
  end

  desc 'fetch seasons'
  task seasons: :environment do
    client = Soccerama::Client.new(ENV['SOCCERAMA_KEY'])
    seasons = client.seasons
    seasons.each do |season|
      Season.create do |c|
        c.original_id = season['id']
        c.competition_id = season['competition_id']
        c.name = season['name']
        c.active = season['active']
      end
    end
  end

  desc 'fetch teams by seasons'
  task teams: :environment do
    seasons_id = Season.pluck(:original_id)
    seasons_id.each do |season|
      begin
        teams = @client.teams_by_season(season)
      rescue => e
        sleep 10
        retry
      end
      teams.each do |team|
        Team.create do |t|
          t.season_id = season
          t.name = team['name']
          t.original_id = team['id']
          t.logo = team['logo']
        end
      end
    end
  end

  desc 'get matches'
  task matches: :environment do

  end

  desc 'TODO'
  task players: :environment do
  end

end
