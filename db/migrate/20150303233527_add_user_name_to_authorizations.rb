class AddUserNameToAuthorizations < ActiveRecord::Migration
  def change
    add_column :authorizations, :username, :string
  end
end
