class CreateImcRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :imc_records do |t|
      t.float :height
      t.float :weight
      t.float :result

      t.timestamps
    end
  end
end
