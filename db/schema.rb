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

ActiveRecord::Schema.define(:version => 20150515152820) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "activities", :force => true do |t|
    t.string   "title"
    t.string   "activitye_type"
    t.integer  "activitye_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "ip_address"
    t.string   "browser"
    t.string   "version_browser"
    t.string   "computer_plataform"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "network_id"
  end

  create_table "admin_messages", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.boolean  "status"
    t.string   "dom_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "position"
  end

  create_table "admin_users", :force => true do |t|
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
    t.string   "online"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.boolean  "correct"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "content"
  end

  create_table "assets", :force => true do |t|
    t.string   "filename"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "course_id"
    t.integer  "user_id"
    t.float    "rub_calification"
    t.text     "brief_description_html"
  end

  create_table "audiences", :force => true do |t|
    t.integer  "user_id"
    t.integer  "channel_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "channels", :force => true do |t|
    t.string   "channel_type"
    t.string   "channel_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
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
    t.integer  "network_id"
    t.integer  "likes"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "contents", :force => true do |t|
    t.string   "contentye_type"
    t.integer  "contentye_id"
    t.text     "content"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "content_html"
  end

  create_table "course_file_id_user_ids", :force => true do |t|
    t.integer  "course_file_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "course_files", :force => true do |t|
    t.string   "file"
    t.boolean  "published"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "course_id_course_file_ids", :force => true do |t|
    t.integer  "course_id"
    t.integer  "course_file_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "coursepublicationings", :force => true do |t|
    t.integer  "course_id"
    t.integer  "wall_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.text     "silabus"
    t.datetime "init_date"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "public_status"
    t.string   "avatar"
    t.string   "coverphoto"
    t.integer  "network_id"
    t.boolean  "active_status", :default => true
    t.integer  "school_id"
  end

  add_index "courses", ["network_id"], :name => "index_courses_on_network_id"
  add_index "courses", ["school_id"], :name => "index_courses_on_school_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "deliveries", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "publish_date"
    t.datetime "end_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
    t.string   "state"
    t.integer  "network_id"
    t.text     "description_html"
  end

  create_table "deliveries_courses", :force => true do |t|
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

  create_table "discussion_assets", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "discussion_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "discussion_assets", ["asset_id"], :name => "index_discussion_assets_on_asset_id"
  add_index "discussion_assets", ["discussion_id"], :name => "index_discussion_assets_on_discussion_id"

  create_table "discussion_courses", :force => true do |t|
    t.integer  "discussion_id"
    t.integer  "course_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "discussion_responses", :force => true do |t|
    t.integer  "discussion_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "discussion_responses", ["discussion_id"], :name => "index_discussion_responses_on_discussion_id"
  add_index "discussion_responses", ["user_id"], :name => "index_discussion_responses_on_user_id"

  create_table "discussions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "network_id"
    t.integer  "user_id"
    t.text     "description_html"
    t.boolean  "evaluable",        :default => false
    t.datetime "publish_date"
    t.datetime "end_date"
  end

  create_table "evaluation_criteria", :force => true do |t|
    t.string   "name"
    t.integer  "evaluation_percentage"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "evaluable_id"
    t.string   "evaluable_type"
  end

  add_index "evaluation_criteria", ["evaluable_id", "evaluable_type"], :name => "index_evaluation_criteria_on_evaluable_id_and_evaluable_type"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "network_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "schedule_id"
    t.string   "schedule_type"
  end

  add_index "events", ["schedule_id", "schedule_type"], :name => "index_events_on_schedule_id_and_schedule_type"

  create_table "events_courses", :force => true do |t|
    t.integer  "course_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.boolean  "accepted"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "google_form_roles", :force => true do |t|
    t.integer  "google_form_id"
    t.integer  "role_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "google_form_roles", ["google_form_id"], :name => "index_google_form_roles_on_google_form_id"
  add_index "google_form_roles", ["role_id"], :name => "index_google_form_roles_on_role_id"

  create_table "google_forms", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.integer  "pollable_id"
    t.string   "pollable_type"
    t.integer  "user_id"
    t.datetime "init_date"
    t.datetime "term_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "google_forms", ["pollable_id", "pollable_type"], :name => "index_google_forms_on_pollable_id_and_pollable_type"
  add_index "google_forms", ["user_id"], :name => "index_google_forms_on_user_id"

  create_table "grades", :force => true do |t|
    t.integer  "gradable_id"
    t.string   "gradable_type"
    t.float    "score"
    t.text     "feedback",      :default => ""
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_id"
  end

  add_index "grades", ["gradable_id", "gradable_type"], :name => "index_grades_on_gradable_id_and_gradable_type"
  add_index "grades", ["user_id"], :name => "index_grades_on_user_id"

  create_table "libraries", :force => true do |t|
    t.integer  "storable_id"
    t.string   "storable_type"
    t.integer  "network_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "title"
    t.text     "description"
  end

  add_index "libraries", ["network_id"], :name => "index_libraries_on_network_id"

  create_table "library_directories", :force => true do |t|
    t.integer  "location_id"
    t.string   "location_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
  end

  add_index "library_directories", ["location_id", "location_type"], :name => "index_library_directories_on_location_id_and_location_type"
  add_index "library_directories", ["user_id"], :name => "index_library_directories_on_user_id"

  create_table "library_files", :force => true do |t|
    t.string   "file"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "location_id"
    t.string   "location_type"
  end

  add_index "library_files", ["location_id", "location_type"], :name => "index_library_files_on_location_id_and_location_type"
  add_index "library_files", ["user_id"], :name => "index_library_files_on_user_id"

  create_table "masive_mailer_for_super_admins", :force => true do |t|
    t.string   "key_m"
    t.string   "title"
    t.text     "message"
    t.integer  "number_of_users"
    t.text     "array_hash_from_sended"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "members_in_course_criteria", :force => true do |t|
    t.integer  "members_in_course_id"
    t.integer  "evaluation_criterium_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "members_in_course_criteria", ["evaluation_criterium_id"], :name => "index_members_in_course_criteria_on_evaluation_criterium_id"
  add_index "members_in_course_criteria", ["members_in_course_id"], :name => "index_members_in_course_criteria_on_members_in_course_id"

  create_table "members_in_courses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "accepted"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "owner"
    t.string   "title",         :default => "curso"
    t.integer  "network_id"
    t.boolean  "active_status", :default => true
  end

  create_table "mesages", :force => true do |t|
    t.text     "mesage"
    t.integer  "user_id"
    t.integer  "channel_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "mesage_html"
  end

  create_table "network_settings", :force => true do |t|
    t.integer  "network_id"
    t.string   "property"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "networks", :force => true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at",                                                                                                                                                                                                                                      :null => false
    t.datetime "updated_at",                                                                                                                                                                                                                                      :null => false
    t.integer  "population"
    t.boolean  "public_register",      :default => true
    t.boolean  "free",                 :default => true
    t.boolean  "register_form"
    t.text     "welcom_message"
    t.string   "image_front"
    t.string   "logo"
    t.string   "logo_type"
    t.text     "titles",               :default => "user: Usuario, profesor: Maestro, student: Alumno, admin: Administrador, course: Curso, courses: Cursos, friend: Amigo, friends: Amigos, comunity: Comunidad, students: Estudiantes, profesores: Profesores"
    t.string   "personalize_domain"
    t.boolean  "authenticate_teacher"
    t.boolean  "evaluable",            :default => true
  end

  create_table "networks_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "network_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notifications", :force => true do |t|
    t.integer  "notificator_id"
    t.string   "notificator_type"
    t.string   "kind"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "active",           :default => true
  end

  create_table "p_id_to_h_ids", :force => true do |t|
    t.integer  "p_id"
    t.integer  "h_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "permissionings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "network_id"
    t.boolean  "suspended"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.string   "description_use"
    t.boolean  "avtive"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "polls", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "question_assets", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "survey_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "value"
    t.text     "content"
  end

  create_table "reported_contents", :force => true do |t|
    t.integer  "user_id"
    t.integer  "network_id"
    t.integer  "reportable_id"
    t.string   "reportable_type"
    t.text     "description",     :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "reported_contents", ["network_id"], :name => "index_reported_contents_on_network_id"
  add_index "reported_contents", ["reportable_id", "reportable_type"], :name => "index_reported_contents_on_reportable_id_and_reportable_type"
  add_index "reported_contents", ["user_id"], :name => "index_reported_contents_on_user_id"

  create_table "response_to_the_evaluations", :force => true do |t|
    t.string   "name"
    t.text     "comment_for_rubre"
    t.integer  "feedbackable_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "feedbackable_type"
    t.integer  "evaluation_criterium_id"
  end

  add_index "response_to_the_evaluations", ["evaluation_criterium_id"], :name => "index_response_to_the_evaluations_on_evaluation_criterium_id"
  add_index "response_to_the_evaluations", ["feedbackable_id", "feedbackable_type"], :name => "feedbackable_index"

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

  create_table "schools", :force => true do |t|
    t.string   "cct"
    t.string   "name"
    t.string   "subsystem"
    t.integer  "entity_id"
    t.string   "entity_name"
    t.integer  "municipality_id"
    t.string   "municipality_name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "survey_assets", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "survey_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "survey_assets", ["asset_id"], :name => "index_survey_assets_on_asset_id"
  add_index "survey_assets", ["survey_id"], :name => "index_survey_assets_on_survey_id"

  create_table "surveyings", :force => true do |t|
    t.integer  "course_id"
    t.integer  "survey_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "surveys", :force => true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.datetime "publish_date"
    t.datetime "end_date"
    t.integer  "network_id"
    t.integer  "user_id"
    t.integer  "poll_id"
    t.string   "state"
    t.boolean  "publish"
    t.integer  "likes"
    t.integer  "timer",        :default => 0
  end

  create_table "time_trying_surveys", :force => true do |t|
    t.integer  "user_id"
    t.integer  "survey_id"
    t.datetime "open_at"
    t.datetime "send_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "time_trying_surveys", ["survey_id"], :name => "index_time_trying_surveys_on_survey_id"
  add_index "time_trying_surveys", ["user_id"], :name => "index_time_trying_surveys_on_user_id"

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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usernotificationings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "notification_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "userpublicationings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "wall_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
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
    t.string   "tour_info",              :default => "000"
    t.boolean  "accepted_terms",         :default => false
    t.string   "subdomain"
    t.string   "domain"
    t.string   "key_analytics"
    t.boolean  "online",                 :default => false
    t.boolean  "tour_network",           :default => false
    t.boolean  "tour_profile",           :default => false
    t.boolean  "tour_course",            :default => false
    t.boolean  "form_before_tour",       :default => false
    t.boolean  "self_register",          :default => false
  end

  add_index "users", ["email", "subdomain"], :name => "index_users_on_email_and_subdomain", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], :name => "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["votable_id", "votable_type"], :name => "index_votes_on_votable_id_and_votable_type"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], :name => "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

  create_table "walls", :force => true do |t|
    t.integer  "publication_id"
    t.string   "publication_type"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "network_id"
    t.boolean  "public",           :default => false
  end

  create_table "wufoo_form_roles", :force => true do |t|
    t.integer  "wufoo_form_id"
    t.integer  "role_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "wufoo_form_roles", ["role_id"], :name => "index_wufoo_form_roles_on_role_id"
  add_index "wufoo_form_roles", ["wufoo_form_id"], :name => "index_wufoo_form_roles_on_wufoo_form_id"

  create_table "wufoo_forms", :force => true do |t|
    t.string   "identifier"
    t.integer  "showable_id"
    t.string   "showable_type"
    t.integer  "user_id"
    t.datetime "init_date"
    t.datetime "term_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "wufoo_forms", ["showable_id", "showable_type"], :name => "index_wufoo_forms_on_showable_id_and_showable_type"
  add_index "wufoo_forms", ["user_id"], :name => "index_wufoo_forms_on_user_id"

  create_table "wufoo_responses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "wufoo_form_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "wufoo_responses", ["user_id"], :name => "index_wufoo_responses_on_user_id"
  add_index "wufoo_responses", ["wufoo_form_id"], :name => "index_wufoo_responses_on_wufoo_form_id"

  create_table "wufoo_settings", :force => true do |t|
    t.integer  "network_id"
    t.string   "api_key"
    t.string   "subdomain"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "wufoo_settings", ["network_id"], :name => "index_wufoo_settings_on_network_id"

end
