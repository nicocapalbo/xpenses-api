class CategoriesController < ApplicationController
  before_action :set_ledger, only: [ :index, :create, :edit, :update ]
  before_action :set_category, only: [ :edit, :update ]

  def index
    @categories = Category.where(ledger: @ledger)
    render json: @categories
  end

  # def new
  #   @category = Category.new
  # end

  # def create
  #   @category = Category.new(category_and_subcat_params)
  #   @category.ledger = @ledger
  #   @category.save! ? redirect_to(ledger_categories_path) : render(:new)
  # end
  
  # def edit
  # end

  # def update
  #   @category.update(category_and_subcat_params) ? redirect_to(ledger_categories_path) : render(:edit)
  # end

  private

  def set_ledger
    @ledger = Ledger.find_by(id: params[:ledger_id])
    render_fail('Ledger not found / Ledger must exist', :bad_request) unless @ledger
  end

  def set_category
    @category = Category.find_by(id: params[:id])
  end

  # def category_and_subcat_params
  #   params.require(:category).permit(:name, abyme_attributes)
  # end
end
