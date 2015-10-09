class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string  :content_type, null: false
      t.string  :size,  null: false
      t.string  :file, null: false

      t.timestamps null: false
    end
  end
end
