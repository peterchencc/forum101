class TopicsController < ApplicationController

  before_action :authenticate_user!, :only => [ :new, :create, :destroy ]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
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
    params.require(:topic).permit(:title, :content)
  end

end
