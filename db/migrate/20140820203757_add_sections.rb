class AddSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.belongs_to :chapter
      t.timestamps
    end

    create_table :chapters do |t|
      t.string :name
      t.timestamps
    end

    change_table :lessons do |t|
      t.belongs_to  :section
    end
  end
end
