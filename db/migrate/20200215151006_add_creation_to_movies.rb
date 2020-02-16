class AddCreationToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :creation, :string
  end
end
