class FinancesController < ApplicationController
  def index
    @finances = Finance.all
    @expenses = Expense.all
  end

end