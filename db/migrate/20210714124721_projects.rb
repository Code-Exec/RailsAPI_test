class Projects < ActiveRecord::Migration[6.1]
  def up
	create_table "projects", force: :cascade do |t|
		t.string "name"
		t.datetime "created_at", precision: 6, null: false
		t.datetime "updated_at", precision: 6, null: false
	end
  end
end
