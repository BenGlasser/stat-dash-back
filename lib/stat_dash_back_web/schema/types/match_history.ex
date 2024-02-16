defmodule StatDashBackWeb.Schema.Types.MatchHistory do
  use Absinthe.Schema.Notation

  alias StatDashBackWeb.Resolvers.Match


  @desc "Represents the match history, must supply either summoner name or puuid"
  object :match_history_queries do
    field :match_history, list_of(:match), description: "The list of matches in the history" do
      arg :name, :string
      arg :puuid, :string

      resolve &Match.get_history/2
    end
  end

  @desc "Represents a match in the match history"
  object :match do
    field :info, :info, description: "Match information"
    field :metadata, :metadata, description: "Match metadata"
  end

  @desc "Represent match info"
  object :info do
          field :game_creation, :integer
          field :game_duration, :integer
          field :game_end_timestamp, :integer
          field :game_id, :integer
          field :game_mode, :string
          field :game_name, :string
          field :game_start_timestamp, :integer
          field :game_type, :string
          field :game_version, :string
          field :map_id, :integer
          field :participants, list_of(:participant)
          field :platform_id, :string
          field :queue_id, :integer
          field :teams, list_of(:team)
          field :tournament_code, :string
  end

  @desc "Represent match metadata"
  object :metadata do
          field :data_version, :string, description: "The data version"
          field :match_id, :string, description: "The match id"
          field :participants, list_of(:string), description: "The list of participant puuids"
  end

  @desc "Represent a team"
  object :team do
          field :bans, list_of(:ban), description: "The list of bans"
          field :objectives, list_of(:objectives), description: "The list of objectives"
          field :team_id, :string, description: "The team id"
          field :win, :string, description: "The win status"
  end

  @desc "Represent a ban"
  object :ban do
          field :champion_id, :integer, description: "The champion id"
          field :pick_turn, :integer, description: "The pick"
  end

  @desc "Represent objectives"
  object :objectives do
          field :baron, :objective, description: "The baron objective"
          field :champion, :objective, description: "The champion objective"
          field :dragon, :objective, description: "The dragon objective"
          field :inhibitor, :objective, description: "The inhibitor objective"
          field :rift_herald, :objective, description: "The rift herald objective"
          field :tower, :objective, description: "The tower objective"
  end

  @desc "Represent an objective"
  object :objective do
          field :first, :boolean, description: "The first objective"
          field :kills, :integer, description: "The number of kills"
  end

  @desc "Represents a participant in a match"
  object :participant do
    field :assists, :integer
    field :baron_kills, :integer
    field :bounty_level, :integer
    field :champion_id, :integer
    field :champion_name, :string
    field :champion_transform, :integer
    field :consumables_purchased, :integer
    field :damage_dealt_to_buildings, :integer
    field :damage_dealt_to_objectives, :integer
    field :damage_dealt_to_turrets, :integer
    field :damage_self_mitigated, :integer
    field :deaths, :integer
    field :detector_wards_placed, :integer
    field :double_kills, :integer
    field :dragon_kills, :integer
    field :first_blood_assist, :boolean
    field :first_blood_kill, :boolean
    field :first_tower_assist, :boolean
    field :first_tower_kill, :boolean
    field :game_ended_in_early_surrender, :boolean
    field :game_ended_in_surrender, :boolean
    field :gold_earned, :integer
    field :gold_spent, :integer
    # Both individualPosition and teamPosition are computed by the game server and are different versions of the most likely position played by a player. The individualPosition is the best guess for which position the player actually played in isolation of anything else. The teamPosition is the best guess for which position the player actually played if we add the constraint that each team must have one top player, one jungle, one middle, etc. Generally the recommendation is to use the teamPosition field over the individualPosition field.
    field :individual_position, :string
    field :inhibitor_kills, :integer
    field :inhibitors_takedowns, :integer
    field :inhibitors_lost, :integer
    field :item0, :integer
    field :item1, :integer
    field :item2, :integer
    field :item3, :integer
    field :item4, :integer
    field :item5, :integer
    field :item6, :integer
    field :items_purchased, :integer
    field :killing_sprees, :integer
    field :kills, :integer
    field :lane, :string
    field :largest_critical_strike, :integer
    field :largest_killing_spree, :integer
    field :largest_multi_kill, :integer
    field :longest_time_spent_living, :integer
    field :magic_damage_dealt, :integer
    field :magic_damage_dealt_to_champions, :integer
    field :magic_damage_taken, :integer
    field :neutral_minions_killed, :integer
    field :nexus_kills, :integer
    field :nexus_takedowns, :integer
    field :nexuses_lost, :integer
    field :objectives_stolen, :integer
    field :objectives_stolen_assists, :integer
    field :participant_id, :integer
    field :penta_kills, :integer
    field :perks, :perks
    field :physical_damage_dealt, :integer
    field :physical_damage_dealt_to_champions, :integer
    field :physical_damage_taken, :integer
    field :profile_icon, :integer
    field :puuid, :string
    field :quadra_kills, :integer
    field :riot_id, :string
    field :riot_id_tagline, :string
    field :role, :string
    field :sight_wards_bought_in_game, :integer
    field :spell1_casts, :integer
    field :spell2_casts, :integer
    field :spell3_casts, :integer
    field :spell4_casts, :integer
    field :summoner1_casts, :integer
    field :summoner2_casts, :integer
    field :summoner_id, :string
    field :summoner_level, :integer
    field :summoner_name, :string
    field :team_early_surrendered, :boolean
    field :team_id, :string
    field :team_position, :string
    field :time_ccing_others, :integer
    field :time_played, :integer
    field :total_damage_dealt, :integer
    field :total_damage_dealt_to_champions, :integer
    field :total_damage_shielded_on_teammates, :integer
    field :total_damage_taken, :integer
    field :total_heal, :integer
    field :total_heals_on_teammates, :integer
    field :total_minions_killed, :integer
    field :total_time_cc_dealt, :integer
    field :total_time_spent_dead, :integer
    field :total_units_healed, :integer
    field :triple_kills, :integer
    field :true_damage_dealt, :integer
    field :true_damage_dealt_to_champions, :integer
    field :true_damage_taken, :integer
    field :turret_kills, :integer
    field :turrets_takedowns, :integer
    field :turrets_lost, :integer
    field :unreal_kills, :integer
    field :vision_score, :integer
    field :vision_wards_bought_in_game, :integer
    field :wards_killed, :integer
    field :wards_placed, :integer
    field :win, :boolean
  end

  @desc "Represent a participant's perks"
  object :perks do
    field :stat_perks, :stat_perks
    field :styles, list_of(:perk_style)
  end

  @desc "Represent a participant's stat perks"
  object :stat_perks do
    field :defense, :integer
    field :flex, :integer
    field :offense, :integer
  end

  @desc "Represent a participant's perk style"
  object :perk_style do
    field :description, :string
    field :selections, list_of(:perk_style_selection)
    field :style, :integer
  end

  @desc "Represent a participant's perk style selection"
  object :perk_style_selection do
    field :perk, :integer
    field :var1, :integer
    field :var2, :integer
    field :var3, :integer
  end
end
