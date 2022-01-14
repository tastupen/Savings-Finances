class SalariesController < ApplicationController
  before_action :authenticate_user!
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
  end

  def destroy
  end

  private

    def salaries_params
      params.require(:salary).permit(:annual_income, :bonus, :rent, :user_id)
    end

end
