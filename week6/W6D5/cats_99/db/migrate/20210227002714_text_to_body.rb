class TextToBody < ActiveRecord::Migration[5.2]
  def change
    rename_column :cats, :descrition, :description
  end
end
