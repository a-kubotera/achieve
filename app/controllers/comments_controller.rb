class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    @notification = @comment.notifications.build(user_id: @blog.user.id )
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }
        push_comment
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを削除しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end


  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(params[:id])
        format.html { redirect_to blog_path(@blog), notice: '修正完了しました！' }
        format.js { render :index }
      else
        format.js { render :index }
      end
    end
  end

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end
    def push_comment
      unless @comment.blog.user_id == current_user.id
        Comment.push_comment(@comment)
      end
      Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'notification_created', {
        unread_counts: Notification.where(user_id: @comment.blog.user.id, read: false).count
      })
    end
end
