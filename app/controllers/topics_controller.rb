class TopicsController < ApplicationController

  before_action :authenticate_user!, :only => [ :new, :create, :destroy ]

  def about

  end

  def index

    if params[:cid]
      category = Category.find(params[:cid])
      @topics = category.topics
    else
      @topics = Topic.all
    end

    @q = @topics.ransack(params[:q])
    @topics = @q.result(distinct: true).page(params[:page])
  end

  def show
    @topic = Topic.find(params[:id])

    unless cookies["view-topic-#{@topic.id}"]
      cookies["view-topic-#{@topic.id}"] = "true"
      @topic.increment!(:views_count)
    end

    @comment = Comment.new
  end

  def new
    @topic = Topic.new
  end

  def create
    #@topic = current_user.topics.new(topic_params)
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      flash[:notice] = "新增成功"
      redirect_to topics_path
    else
      render :action => :new
    end
  end


  protected

  def topic_params
    params.require(:topic).permit(:title, :content, :category_ids =>[ ] )
  end

end
