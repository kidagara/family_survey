class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :last_name
      t.string :employee_first_name
      t.string :employee_email
      t.string :partner_first_name
      t.integer :decendents_under2
      t.integer :decendents_2to5
      t.integer :decendents_6to12
      t.integer :decendents_13to17
      t.integer :decendents_over18
      t.timestamps
    end
  end
end
