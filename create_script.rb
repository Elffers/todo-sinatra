require 'sequel'

# Running this script will create a new SQLite DB
# This is pretty much a one-time use file

db = Sequel.connect('sqlite://todo.db')

db.create_table(:todoings) do
  primary_key :id
  string :item
  integer :done, default: 0
end
