class CreateBiblios < ActiveRecord::Migration
  def change
    create_table :biblios do |t|
      t.text :text

      t.timestamps null: false
    end
  end
end
