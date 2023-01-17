class RenameForumThreadIdToForumthreadId < ActiveRecord::Migration[7.0]
    def change
      rename_column :comments, :ForumThread_id, :forumthread_id
    end    
end
