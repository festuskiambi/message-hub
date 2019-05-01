class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :originator
      t.string :content
      t.string :recipient
      t.integer :status

      t.timestamps
    end
  end
end
