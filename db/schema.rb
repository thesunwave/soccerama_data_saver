# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160612211339) do

  create_table "competitions", force: :cascade do |t|
    t.integer  "original_competition_id"
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "original_id"
    t.integer  "match_id"
    t.integer  "team_id"
    t.integer  "minute"
    t.integer  "assist_id"
    t.integer  "related_event_id"
    t.integer  "player_in_id"
    t.integer  "player_out_id"
    t.string   "extra_min"
    t.string   "event_type"
    t.integer  "player_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["match_id"], name: "index_events_on_match_id"
    t.index ["player_id"], name: "index_events_on_player_id"
    t.index ["team_id"], name: "index_events_on_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "competition_id"
    t.integer  "season_id"
    t.integer  "original_id"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "home_score"
    t.integer  "away_score"
    t.integer  "home_score_penalties"
    t.integer  "away_score_penalties"
    t.integer  "round_id"
    t.datetime "starting_date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["competition_id"], name: "index_matches_on_competition_id"
    t.index ["season_id"], name: "index_matches_on_season_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer  "original_id"
    t.integer  "team_id"
    t.string   "name"
    t.string   "nationality"
    t.string   "birth_country"
    t.date     "birth_date"
    t.string   "birth_place"
    t.integer  "height"
    t.integer  "weight"
    t.string   "position"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "competition_id"
    t.integer  "original_id"
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["competition_id"], name: "index_seasons_on_competition_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "season_id"
    t.string   "name"
    t.string   "logo"
    t.integer  "original_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["season_id"], name: "index_teams_on_season_id"
  end

end
