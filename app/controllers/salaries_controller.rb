class SalariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_salary, only: %i[ show edit update destroy ]
  def show
  end

  def new
    @salary = Salary.new
  end

  def create
    @salary = Salary.new(salaries_params)
    
    @salary.user_id = current_user.id
    if @salary.save
      redirect_to maneys_path, notice: "登録完了です"
    else
      redirect_to new_salary_path, alert: "登録に失敗しました"
    end
  end

  def edit
  end

  def update
    if @salary.update(salaries_params)
      redirect_to maneys_path, notice: "更新完了です"
    else
      redirect_to edit_salary_path(@salary), alert: "更新に失敗しました"
    end
  end

  private

    def set_salary
      @salary = Salary.find_by(user_id: current_user.id)
    end

    def salaries_params
      params.require(:salary).permit(:annual_income, :bonus, :rent, :user_id)
    end
end
