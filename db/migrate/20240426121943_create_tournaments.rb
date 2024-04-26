class CreateTournaments < ActiveRecord::Migration[7.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :sport
      t.string :tournament_type
      t.integer :teams_count
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
