class ManeysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_maney, only: %i[ show edit update destroy ]

  # GET /maneys or /maneys.json
  def index
    if sort_params.present?
      @year = sort_params[:year]
      @month = sort_params[:month]
      date = Date.parse(@year + "/" + @month)
      @maneys = current_user.maneys.where(created_at: date.all_month).order("created_at asc")
      @chart = current_user.maneys.where(created_at: date.all_month)
    else
      #今月
      @maneys = current_user.maneys.where(created_at: Time.current.all_month).order("created_at asc")
      @chart = current_user.maneys.where(created_at: Time.current.all_month)
    end
    @year_sort_list = Maney.year_sort_list
    @month_sort_list = Maney.month_sort_list
    @categories = Category.all
    #月々使えるお金を算出する
    @salaries = Salary.where(user_id: current_user.id)
    @annual_income = @salaries.pluck(:annual_income)[0]
    @bonus = @salaries.pluck(:bonus)[0]
    @rent = @salaries.pluck(:rent)[0]
    @salary = (@annual_income - @bonus) / 12 - @rent
  end

  # GET /maneys/1 or /maneys/1.json
  def show
  end

  # GET /maneys/new
  def new
    @maney = current_user.maneys.new
    @categories = Category.all
  end

  # GET /maneys/1/edit
  def edit
    @categories = Category.all
  end

  # POST /maneys or /maneys.json
  def create
    @maney = current_user.maneys.new(maney_params)

    respond_to do |format|
      if @maney.save
        format.html { redirect_to maneys_path, notice: "Maney was successfully created." }
        format.json { render :show, status: :created, location: @maney }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maney.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maneys/1 or /maneys/1.json
  def update
    respond_to do |format|
      if @maney.update(maney_params)
        format.html { redirect_to maneys_path, notice: "Maney was successfully updated." }
        format.json { render :show, status: :ok, location: @maney }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maney.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maneys/1 or /maneys/1.json
  def destroy
    @maney.destroy

    respond_to do |format|
      format.html { redirect_to maneys_url, notice: "Maney was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maney
      @maney = current_user.maneys.find(params[:id])
      redirect_to(maneys_url, alert: "ERROR!!") if @maney.blank?
    end

    # Only allow a list of trusted parameters through.
    def maney_params
      params.require(:maney).permit(:content, :price, :integer, :user_id, :category_id)
    end

    def sort_params
      params.permit(:year, :month)
    end 
end
