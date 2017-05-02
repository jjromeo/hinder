class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :photo, foreign_key: true
      t.string :vote_type

      t.timestamps
    end
  end
end
