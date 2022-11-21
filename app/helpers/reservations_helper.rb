module ReservationsHelper
  def tables_for_select
    Table.all.map(&:id)
  end

  def clients_for_select
    # collect clients by their name with id value
    Client.all.map(&:id)
  end
end
