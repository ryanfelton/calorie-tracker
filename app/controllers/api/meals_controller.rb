class Api::MealsController < ApiController
  respond_to :json
  before_filter :set_user

  def index
    respond_with :api, @user.meals.all
  end

  def create
    respond_with :api, @user.meals.create(meal_params), :location => nil
  end

  def update
    respond_with :api, @user.meals.update(params[:id], meal_params)
  end

  def destroy
    respond_with :api, @user.meals.destroy(params[:id])
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    def meal_params
      params.require(:meal).permit(:user_id, :name, :number_of_calories, :consumed_at)
    end
end
