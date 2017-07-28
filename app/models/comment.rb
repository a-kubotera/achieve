class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many :notifications, dependent: :destroy

    def self.push_comment(name)
      Pusher.trigger("user_#{name.blog.user_id}_channel", 'comment_created', {
        message: 'あなたの作成したブログにコメントが付きました'
      })
    end
end
