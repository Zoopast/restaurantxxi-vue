class ExpensesController < ApplicationController
  def show
    @expense = Expense.find(params[:id])
    @expense_items = @expense.expense_items
  end
end