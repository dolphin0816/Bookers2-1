class AddUserIntroductionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_introduction, :string
  end
end
