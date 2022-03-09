class CreateMissions < ActiveRecord::Migration[7.0]
  def change

    create_table :missions do |t|
      t.string :name

      t.timestamps
    end

    create_join_table :listings, :missions
  end
end
