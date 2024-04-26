FactoryBot.define do
  factory :tournament do
    name { "example" }
    sport { "soccer" }
    tournament_type { "tabela" }
    teams_count { 8 }
    start_date { "2024-04-26" }
    end_date { "2024-05-26" }
    status { "active" }
  end
end
