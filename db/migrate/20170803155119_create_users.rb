class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :location
      t.string :tagline
      t.string :img_url
    end
  end
end
