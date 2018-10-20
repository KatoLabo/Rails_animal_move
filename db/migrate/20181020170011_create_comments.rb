class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :m_total_score
      t.integer :m_mess
      t.integer :m_smell

      t.timestamps
    end
  end
end
