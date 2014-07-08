class ExtraCommentColsForAkismetor < ActiveRecord::Migration
  def change
    add_column :comments, :user_ip, :string
    add_column :comments, :user_agent, :string
    add_column :comments, :referrer, :string
    add_column :comments, :approved, :boolean, default: false, null: false
    Comment.update_all("approved=true")
  end
end
