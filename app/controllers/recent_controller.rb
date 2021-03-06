class RecentController < ApplicationController
  expose (:recently_created_collection_items) { CollectionItem.order('created_at DESC').limit(40) }
  expose (:recently_created_pages)            { Page.order('created_at DESC').limit(40) }
  expose (:recently_created_resources)        { Resource.order('created_at DESC').limit(40) }


  expose (:recently_edited_collection_items) { CollectionItem.order('updated_at DESC').limit(40).select{|ci|ci.created_at!=ci.updated_at}[0..39] }
  expose (:recently_edited_pages)            { Page.order('updated_at DESC').limit(200).select{|p|p.created_at!=p.updated_at}[0..39] }
  expose (:recently_edited_resources)        { Resource.order('updated_at DESC').limit(500).select{|p|p.created_at!=p.updated_at}[0..39] }

  expose (:recently_created_comments){Comment.where(approved: true).order('created_at DESC').limit(200)}

  expose (:recently_created_collection_item_comments){ recently_created_comments.select{|c| c.commentable.class == CollectionItem }[0..39] }
  expose (:recently_created_page_comments)           { recently_created_comments.select{|c| c.commentable.class == Page }[0..39] }
  expose (:recently_created_resource_comments)       { recently_created_comments.select{|c| c.commentable.class == Resource}[0..39] }
end