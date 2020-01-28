class ReplicasController < ApplicationController
  before_action :set_replica, only: [:show, :edit, :update, :destroy]

  # GET /replicas
  # GET /replicas.json
  def index
    @replicas = Replica.all
  end

  # GET /replicas/1
  # GET /replicas/1.json
  def show
  end

  # GET /replicas/new
  def new
    @replica = Replica.new
  end

  # GET /replicas/1/edit
  def edit
  end

  # POST /replicas
  # POST /replicas.json
  def create
    @replica = Replica.new(replica_params)

    respond_to do |format|
      if @replica.save
        format.html { redirect_to @replica, notice: 'Replica was successfully created.' }
        format.json { render :show, status: :created, location: @replica }
      else
        format.html { render :new }
        format.json { render json: @replica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replicas/1
  # PATCH/PUT /replicas/1.json
  def update
    respond_to do |format|
      if @replica.update(replica_params)
        format.html { redirect_to @replica, notice: 'Replica was successfully updated.' }
        format.json { render :show, status: :ok, location: @replica }
      else
        format.html { render :edit }
        format.json { render json: @replica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replicas/1
  # DELETE /replicas/1.json
  def destroy
    @replica.destroy
    respond_to do |format|
      format.html { redirect_to replicas_url, notice: 'Replica was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_replica
      @replica = Replica.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def replica_params
      params.require(:replica).permit(:position, :type, :timeout)
    end
end
