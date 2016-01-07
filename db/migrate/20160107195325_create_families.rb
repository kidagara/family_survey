class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :user_id
      t.string :family_name
      t.integer :members_under2
      t.integer :members_2to5
      t.integer :members_6to12
      t.integer :members_13to17
      t.integer :members_over18
      t.timestamps
    end
  end
end
