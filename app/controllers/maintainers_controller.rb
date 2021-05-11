class MaintainersController < ApplicationController
  before_action :set_maintainer, only: %i[ show edit update destroy ]

  # GET /maintainers or /maintainers.json
  def index
    @maintainers = Maintainer.all
  end

  # GET /maintainers/1 or /maintainers/1.json
  def show
  end

  # GET /maintainers/new
  def new
    @maintainer = Maintainer.new
  end

  # GET /maintainers/1/edit
  def edit
  end

  # POST /maintainers or /maintainers.json
  def create
    @maintainer = Maintainer.new(maintainer_params)

    respond_to do |format|
      if @maintainer.save
        format.html { redirect_to @maintainer, notice: "Maintainer was successfully created." }
        format.json { render :show, status: :created, location: @maintainer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintainers/1 or /maintainers/1.json
  def update
    respond_to do |format|
      if @maintainer.update(maintainer_params)
        format.html { redirect_to @maintainer, notice: "Maintainer was successfully updated." }
        format.json { render :show, status: :ok, location: @maintainer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintainers/1 or /maintainers/1.json
  def destroy
    @maintainer.destroy
    respond_to do |format|
      format.html { redirect_to maintainers_url, notice: "Maintainer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintainer
      @maintainer = Maintainer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintainer_params
      params.require(:maintainer).permit(:name, :references)
    end
end
