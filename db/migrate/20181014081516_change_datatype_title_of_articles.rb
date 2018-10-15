class ChangeDatatypeTitleOfArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :messies, :total_score, :varchar
    change_column :messies, :mess, :varchar
    change_column :messies, :smell, :varchar
    change_column :messies, :user_id, :varchar
  end
end
