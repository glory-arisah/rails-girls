class CommentsController < ApplicationController
  before_action :get_idea, only: %i[ new create edit update destroy ]
  before_action :set_comment, only: %i[ edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = @idea.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to "/ideas/#{@idea.id}" }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to "/ideas/#{@idea.id}", notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to "/ideas/#{@idea.id}", notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_idea
      @idea = Idea.find(params[:idea_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @idea.comments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:user_name, :body, :idea_id)
    end
end
