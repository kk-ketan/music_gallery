class AddPublishedToMusics < ActiveRecord::Migration[7.0]
  def change
    add_column :musics, :published, :boolean, default:false
  end
end
