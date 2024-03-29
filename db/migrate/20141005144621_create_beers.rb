class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :score, default: 0
      t.belongs_to :brewery

      t.timestamps
    end
  end
end
