class ChangingColumnsInFlight < ActiveRecord::Migration[5.2]
  def change
    rename_column :flights, :start_airport, :origin_id
    rename_column :flights, :finish_airport, :destination_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
