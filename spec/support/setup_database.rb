ActiveRecord::Base.configurations = {'test' => {adapter: 'sqlite3', database: ':memory:'}}
ActiveRecord::Base.establish_connection :test

class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:test_users) do |t|
      t.string :name
    end
  end
end

ActiveRecord::Migration.verbose = false
CreateAllTables.up
