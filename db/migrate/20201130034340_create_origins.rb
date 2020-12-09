class CreateOrigins < ActiveRecord::Migration[6.0]
  def change
    create_table :origins do |t|
      t.references :user             
      t.string     :book_title,           null: false
      t.text       :text,                 null: false
      t.string     :youtube_url,          null: false
      t.text       :amazon,               null: false
      t.integer    :category_id,          null: false
      t.timestamps
    end
  end
end
