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

ActiveRecord::Schema.define(:version => 20130218172833) do

  create_table "activities", :force => true do |t|
    t.string   "title"
    t.string   "activity_type"
    t.integer  "activable"
    t.string   "place"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.string   "content"
    t.boolean  "correct"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "areas_of_evaluations", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "assignment_id"
    t.integer  "evaluation_percentage"
    t.boolean  "active"
    t.datetime "date_of_item"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "delivery_id"
  end

  create_table "assets", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "file"
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "encryption_code_to_access"
  end

  create_table "assignment_assets", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "assignment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "assignments", :force => true do |t|
    t.string   "title"
    t.text     "brief_description"
    t.integer  "delivery_id"
    t.integer  "accomplishment"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "course_id"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "name"
    t.string   "client_secret"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                           :default => "comments"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.integer  "netwok_id"
    t.text     "comment_html"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "compart_assets", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "delivery_id"
    t.integer  "assignment_id"
    t.integer  "comment_id"
    t.integer  "question_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.text     "silabus"
    t.datetime "init_date"
    t.datetime "finish_date"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "public_status"
    t.string   "avatar"
    t.string   "coverphoto"
    t.integer  "delivery_id"
    t.integer  "survey_param_evaluation"
    t.integer  "delivery_param_evaluation"
    t.integer  "network_id"
  end

  create_table "deliveries", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "publish_date"
    t.datetime "end_date"
    t.integer  "porcent_of_evaluation"
    t.integer  "course_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "user_id"
    t.string   "state"
    t.integer  "network_id"
  end

  create_table "deliveries_courses", :id => false, :force => true do |t|
    t.integer  "course_id"
    t.integer  "delivery_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "delivery_assets", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "delivery_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "discussions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "network_id"
    t.integer  "user_id"
  end

  create_table "discussions_courses", :force => true do |t|
    t.integer  "discussion_id"
    t.integer  "course_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "network_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "etag"
    t.integer  "schedule_id"
    t.string   "schedule_type"
    t.integer  "course_id"
  end

  add_index "events", ["schedule_id", "schedule_type"], :name => "index_events_on_schedule_id_and_schedule_type"

  create_table "events_courses", :force => true do |t|
    t.integer  "course_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members_in_courses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "accepted"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "owner"
    t.string   "title",      :default => "curso"
    t.integer  "network_id"
  end

  create_table "network_templates", :force => true do |t|
    t.integer  "network_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "networks", :force => true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "population"
  end

  create_table "networks_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "network_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notificacions", :force => true do |t|
    t.integer  "notificator_id"
    t.string   "notificator_type"
    t.integer  "user_id"
    t.string   "kind"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "notifications", :force => true do |t|
    t.integer  "notificator_id"
    t.string   "notificator_type"
    t.integer  "user_id"
    t.string   "kind"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "active",           :default => true
  end

  create_table "permissionings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "network_id"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.string   "description_use"
    t.boolean  "avtive"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "question_assets", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "survey_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "value"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "response_to_the_evaluations", :force => true do |t|
    t.string   "name"
    t.text     "comment_for_rubre"
    t.integer  "assignment_id"
    t.integer  "course_id"
    t.integer  "evaluation_porcentage"
    t.integer  "rub_calification"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "role_id_and_permission_ids", :force => true do |t|
    t.integer  "role_id"
    t.integer  "permission_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "created"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "surveyings", :force => true do |t|
    t.integer  "course_id"
    t.integer  "survey_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "surveys", :force => true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "publish_date"
    t.datetime "end_date"
    t.integer  "network_id"
    t.integer  "user_id"
  end

  create_table "user_friends", :force => true do |t|
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "friend_one"
    t.integer  "friend_two"
    t.integer  "status_friendship", :default => 0
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "network_id"
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_survey_responses", :force => true do |t|
    t.integer  "user_survey_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "user_surveys", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.float    "result"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "description"
    t.string   "personal_url"
    t.string   "avatar"
    t.string   "coverphoto"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.text     "bios"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "walls", :force => true do |t|
    t.integer  "publication_id"
    t.string   "publication_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
  end

end
