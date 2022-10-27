class HomeworksController < ApplicationController
  before_action :set_homework, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /homeworks or /homeworks.json
  def index
    @homeworks = Homework.all
  end

  # GET /homeworks/1 or /homeworks/1.json
  def show
  end

  # GET /homeworks/new
  def new
    # @homework = Homework.new
    @homework = current_user.homeworks.build
  end

  # GET /homeworks/1/edit
  def edit
  end

  # POST /homeworks or /homeworks.json
  def create
    #@homework = Homework.new(homework_params)
    @homework = current_user.homeworks.build(homework_params)
    respond_to do |format|
      if @homework.save
        format.html { redirect_to homework_url(@homework), notice: "Assignment was successfully created." }
        format.json { render :show, status: :created, location: @homework }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeworks/1 or /homeworks/1.json
  def update
    respond_to do |format|
      if @homework.update(homework_params)
        format.html { redirect_to homework_url(@homework), notice: "Homework was successfully updated." }
        format.json { render :show, status: :ok, location: @homework }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeworks/1 or /homeworks/1.json
  def destroy
    @homework.destroy

    respond_to do |format|
      format.html { redirect_to homeworks_url, notice: "Assignment deleted." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @homework = current_user.homeworks.find_by(id: params[:id])
    redirect_to homeworks_path, notice, "Error: You are not authorized to edit this assignment." if @homework.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def homework_params
      params.require(:homework).permit(:title, :due_date, :category, :subject, :status, :user_id)
    end
end
