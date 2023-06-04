class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.integer :role
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :task, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
