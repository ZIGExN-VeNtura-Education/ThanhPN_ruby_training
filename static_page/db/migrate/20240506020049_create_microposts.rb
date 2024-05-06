class CreateMicroposts < ActiveRecord::Migration[6.1]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    # Add index cho micropost. TÌm kiếm dựa trên user và order dựa trên ngày tạo => Tăng tốc query
    add_index :microposts, [:user_id, :created_at]
  end
end
