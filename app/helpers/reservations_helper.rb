module ReservationsHelper
  def tables_for_select
    Table.all.map { |table| { label: table.table_number, value: table.id } }
  end

  def clients_for_select
    # collect clients by their name with id value
    Client.all.map { |client| { label: client.full_name, value: client.id } }
  end
end
