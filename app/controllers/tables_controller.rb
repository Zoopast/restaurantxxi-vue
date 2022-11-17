class TablesController < ApplicationController
  before_action :set_table, only: %i[show edit update destroy]
  def index
    @tables = Table.all
  end

  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to tables_path
    else
      render 'index'
    end
  end

  def destroy
    @table.destroy!
    redirect_to tables_path
  end

  def update_table
    table = current_table
    if table.update!(table_params)
      redirect_to tables_path
    else
      render json: table.errors, status: :unprocessable_entity
    end
  end

  private

  def current_table
    @current_table ||= Table.find(params[:table][:id])
  end

  def set_table
    @table = Table.find(params[:id])
  end

  def table_params
    params.require(:table).permit(:name, :capacity, :restaurant_id)
  end
end