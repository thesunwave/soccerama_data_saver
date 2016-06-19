require 'soccerama'

namespace :soccerama do
  @client = Soccerama::Client.new(ENV['SOCCERAMA_KEY'])
  desc 'fetch competitions'
  task competitions: :environment do
    client = Soccerama::Client.new(ENV['SOCCERAMA_KEY'])
    comp = client.competitions(options: :seasons)
    comp.each do |competition|
      next if competition['name'] != 'Champions League'
      Competition.create! do |c|
        c.original_competition_id = competition['id']
        c.name = competition['name']
        c.active = competition['active']
      end
      seasons = competition['seasons']['data']
      seasons.each do |season|
        Season.create! do |c|
          c.original_id = season['id']
          c.competition_id = season['competition_id']
          c.name = season['name']
          c.active = season['active']
        end
      end
    end
  end

  # desc 'fetch seasons'
  # task seasons: :environment do
  #   client = Soccerama::Client.new(ENV['SOCCERAMA_KEY'])
  #   seasons = client.seasons
  #   seasons.each do |season|
  #     Season.create! do |c|
  #       c.original_id = season['id']
  #       c.competition_id = season['competition_id']
  #       c.name = season['name']
  #       c.active = season['active']
  #     end
  #   end
  # end

  desc 'fetch teams by seasons'
  task teams: :environment do
    seasons_id = Season.pluck(:original_id)
    seasons_id.each do |season|
      begin
        teams = @client.teams_by_season(season, options: :players)
        puts teams
      rescue => e
        sleep 10
        retry
      end
      teams.each do |team|
        puts team
        Team.create! do |t|
          t.season_id = season
          t.name = team['name']
          t.original_id = team['id']
          t.logo = team['logo']

          players = team['players']['data']
          players.each do |player|
            puts "Player: #{player}"
            Player.create! do |p|
              p.original_id = player['id']
              p.team_id = team['id']
              p.name = player['name']
              p.nationality = player['nationality']
              p.birth_country = player['birth_country']
              p.birth_date = player['birth_date']
              p.birth_place = player['birth_place']
              p.height = player['height']
              p.weight = player['weight']
            end
          end
        end
      end
    end
  end

  desc 'get matches by team and season'
  task matches: :environment do
    seasons_id = Season.pluck(:original_id)
    teams = Team.where(season_id: seasons_id)
    seasons_id.each do |season|
      teams.each do |team|
        begin
          matches = @client.matches_by_team_season(team.original_id, season)
        rescue => e
          puts e
          next if e == Soccerama::Exceptions::UnpaidPlanException
          sleep 10
          retry
        end

        current = matches['matches']['data']
        current.each do |cm|
          puts cm
          Match.create! do |m|
            m.season_id = season
            m.competition_id = cm['competition_id']
            m.original_id = cm['id']
            m.home_team_id = cm['home_team_id']
            m.away_team_id = cm['away_team_id']
            m.home_score = cm['home_score']
            m.away_score = cm['away_score']
            m.home_score_penalties = cm['home_score_penalties']
            m.away_score_penalties = cm['away_score_penalties']
            m.round_id = cm['round_id']
            m.starting_date = cm['starting_date']
          end
        end
      end
    end
  end

  desc 'get events'
  task events: :environment do
    matches_ids = Match.pluck(:original_id)
    matches_ids.each do |id|
      begin
      match = @client.events_in_match(id)['data']
      rescue => e
        puts e
        sleep 10
        retry
      end
      match.each do |event|
        puts event
        Event.create! do |e|
          e.original_id = event['id']
          e.match_id = event['match_id']
          e.team_id = event['team_id']
          e.player_id = event['player_id']
          e.minute = event['minute']
          e.extra_min = event['extra_min']
          e.event_type = event['type']
          e.assist_id = event['assist_id']
          e.player_in_id = event['player_in_id']
          e.player_out_id = event['player_out_id']
        end
      end
    end
  end

  # desc 'TODO'
  # task players: :environment do
  #   events_ids = Event.pluck(:original_id)
  #   events_ids.each do |id|
  #     begin
  #       event = @client.events_in_match(id)['data']
  #     rescue => e
  #       puts e
  #       sleep 10
  #       retry
  #     end
  #     match.each do |event|
  #       puts event
  #       Event.create! do |e|
  #         e.original_id = event['id']
  #         e.match_id = event['match_id']
  #         e.team_id = event['team_id']
  #         e.player_id = event['player_id']
  #         e.minute = event['minute']
  #         e.extra_min = event['extra_min']
  #         e.event_type = event['type']
  #         e.assist_id = event['assist_id']
  #         e.player_in_id = event['player_in_id']
  #         e.player_out_id = event['player_out_id']
  #       end
  #     end
  #   end
  # end

end
