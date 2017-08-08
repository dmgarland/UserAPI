class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :link
      t.text :description
      t.string :img_url
    end
  end
end
