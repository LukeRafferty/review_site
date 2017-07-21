class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :review
      t.belongs_to :user
      t.boolean :up_down

      t.timestamps
    end
  end
end
