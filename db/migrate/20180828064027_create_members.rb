class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
    	# 名前
      t.string :name, null: false
      # 参加日
      t.date :date, null: true
      # userモデルのuser_idに結びつけるため、必要
      t.integer :user_id, null: true
      t.timestamps
    end
  end
end
