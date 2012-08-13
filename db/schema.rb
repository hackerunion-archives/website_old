# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120813171047) do

  create_table "affiliations", :force => true do |t|
    t.string "name"
  end

  create_table "affiliations_members", :id => false, :force => true do |t|
    t.integer "affiliation_id"
    t.integer "member_id"
  end

  add_index "affiliations_members", ["affiliation_id", "member_id"], :name => "by_affiliation_and_member", :unique => true
  add_index "affiliations_members", ["affiliation_id", "member_id"], :name => "index_affiliations_members_on_affiliation_id_and_member_id"

  create_table "announcements", :force => true do |t|
    t.string    "title",                         :null => false
    t.text      "text",                          :null => false
    t.integer   "member_id"
    t.boolean   "approved",   :default => false, :null => false
    t.timestamp "created_at",                    :null => false
    t.timestamp "updated_at",                    :null => false
  end

  create_table "events", :force => true do |t|
    t.string    "title"
    t.string    "description"
    t.boolean   "approved",    :default => false
    t.integer   "member_id"
    t.timestamp "created_at",                     :null => false
    t.timestamp "updated_at",                     :null => false
    t.timestamp "starts"
    t.timestamp "ends"
  end

  create_table "members", :force => true do |t|
    t.string    "name"
    t.boolean   "approved",               :default => false, :null => false
    t.string    "email",                  :default => "",    :null => false
    t.string    "encrypted_password",     :default => "",    :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at",                                :null => false
    t.timestamp "updated_at",                                :null => false
    t.boolean   "admin",                  :default => false
    t.boolean   "ambassador",             :default => false
    t.text      "whyhacker"
    t.string    "city"
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "members_skills", :id => false, :force => true do |t|
    t.integer "member_id"
    t.integer "skill_id"
  end

  add_index "members_skills", ["member_id", "skill_id"], :name => "by_member_and_skill", :unique => true
  add_index "members_skills", ["member_id", "skill_id"], :name => "index_members_skills_on_member_id_and_skill_id"

  create_table "skills", :force => true do |t|
    t.string "name"
  end

end
