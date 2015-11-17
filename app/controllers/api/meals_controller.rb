class Api::MealsController < ApiController
  respond_to :json

  def index
    respond_with :api, api_user.meals.all
  end

  def create
    respond_with :api, api_user.meals.create(meal_params), :location => nil
  end

  def update
    respond_with :api, api_user.meals.update(params[:id], meal_params)
  end

  def destroy
    respond_with :api, api_user.meals.destroy(params[:id])
  end

  private

    def meal_params
      params.require(:meal).permit(:user_id, :name, :number_of_calories, :consumed_at)
    end
end
