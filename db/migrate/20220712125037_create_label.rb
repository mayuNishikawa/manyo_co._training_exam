class CreateLabel < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.string :name
    end
  end
end
