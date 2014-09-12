class Comment < ActiveRecord::Base
  belongs_to :page
  belongs_to :commentable, polymorphic: true
end

class MoveCommentsToPolymorphic < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.belongs_to :commentable, polymorphic: true
    end

    Comment.all.each do |c|
      c.commentable = c.page
      c.save!
    end
  end
end
