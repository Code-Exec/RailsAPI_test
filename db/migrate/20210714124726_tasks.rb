class Tasks < ActiveRecord::Migration[6.1]
  def up
	  create_table "tasks", force: :cascade do |t|
		t.string "name"
		t.string "subject"
		t.boolean "done", default: false
		t.integer "project_id", null: false
		t.integer "priority", default: 0
		t.datetime "created_at", precision: 6, null: false
		t.datetime "updated_at", precision: 6, null: false
		t.index ["project_id"], name: "index_tasks_on_project_id"
	  end
  end
end
