class CoversationsController < ApplicationController
  before_action :set_coversation, only: [:show, :edit, :update, :destroy]

  # GET /coversations
  # GET /coversations.json
  def index
    @coversations = Coversation.all
  end

  # GET /coversations/1
  # GET /coversations/1.json
  def show
  end

  # GET /coversations/new
  def new
    @coversation = Coversation.new
  end

  # GET /coversations/1/edit
  def edit
  end

  # POST /coversations
  # POST /coversations.json
  def create
    @coversation = Coversation.new(coversation_params)

    respond_to do |format|
      if @coversation.save
        format.html { redirect_to @coversation, notice: 'Coversation was successfully created.' }
        format.json { render :show, status: :created, location: @coversation }
      else
        format.html { render :new }
        format.json { render json: @coversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coversations/1
  # PATCH/PUT /coversations/1.json
  def update
    respond_to do |format|
      if @coversation.update(coversation_params)
        format.html { redirect_to @coversation, notice: 'Coversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @coversation }
      else
        format.html { render :edit }
        format.json { render json: @coversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coversations/1
  # DELETE /coversations/1.json
  def destroy
    @coversation.destroy
    respond_to do |format|
      format.html { redirect_to coversations_url, notice: 'Coversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coversation
      @coversation = Coversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coversation_params
      params.require(:coversation).permit(:title, :description)
    end
end
