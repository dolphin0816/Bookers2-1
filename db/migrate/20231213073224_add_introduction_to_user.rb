class AddIntroductionToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introduction, :text
  end

def up
    add_column :users, :introduction, :string
  end

  def down
    remove_column :users, :introduction, :string
  end
end
