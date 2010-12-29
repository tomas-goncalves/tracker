# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 84) do

  create_table "accounts", :force => true do |t|
    t.column "name",      :string,  :null => false
    t.column "is_credit", :boolean, :null => false
    t.column "position",  :integer, :null => false
  end

  create_table "attachments", :force => true do |t|
    t.column "name",                    :string
    t.column "attachment_file_name",    :string
    t.column "attachment_content_type", :string
    t.column "attachment_file_size",    :integer
    t.column "attachment_updated_at",   :datetime
    t.column "event_id",                :integer
    t.column "updated_at",              :datetime
    t.column "created_at",              :datetime
  end

  create_table "bugs", :force => true do |t|
    t.column "member_id",    :integer
    t.column "submitted_on", :datetime
    t.column "description",  :text,                        :null => false
    t.column "confirmed",    :boolean,  :default => false, :null => false
    t.column "resolved",     :boolean,  :default => false, :null => false
    t.column "resolved_on",  :datetime
    t.column "comment",      :text
    t.column "closed",       :boolean,  :default => false, :null => false
    t.column "priority",     :string
    t.column "created_on",   :datetime
    t.column "updated_on",   :datetime
  end

  create_table "email_forms", :force => true do |t|
    t.column "description", :string, :null => false
    t.column "contents",    :text,   :null => false
  end

  create_table "emails", :force => true do |t|
    t.column "event_id",   :integer,                     :null => false
    t.column "sender",     :string,   :default => "",    :null => false
    t.column "timestamp",  :datetime,                    :null => false
    t.column "contents",   :text,                        :null => false
    t.column "status",     :string,   :default => "New", :null => false
    t.column "subject",    :string,                      :null => false
    t.column "message_id", :string,                      :null => false
  end

  add_index "emails", ["event_id"], :name => "emails_event_id_index"
  add_index "emails", ["sender"], :name => "emails_sender_index"
  add_index "emails", ["subject"], :name => "emails_subject_index"
  add_index "emails", ["contents"], :name => "emails_contents_index"

  create_table "equipment", :force => true do |t|
    t.column "parent_id",   :integer, :null => false
    t.column "description", :string,  :null => false
    t.column "position",    :integer, :null => false
    t.column "shortname",   :string,  :null => false
  end

  add_index "equipment", ["description"], :name => "equipment_description_index"
  add_index "equipment", ["parent_id"], :name => "equipment_parent_id_index"

  create_table "equipment_categories", :force => true do |t|
    t.column "name",      :string,  :null => false
    t.column "parent_id", :integer, :null => false
    t.column "position",  :integer, :null => false
  end

  add_index "equipment_categories", ["name"], :name => "equipment_categories_name_index"
  add_index "equipment_categories", ["parent_id"], :name => "equipment_categories_parent_id_index"

  create_table "equipment_eventdates", :id => false, :force => true do |t|
    t.column "eventdate_id", :integer, :null => false
    t.column "equipment_id", :integer, :null => false
  end

  create_table "event_requests", :force => true do |t|
    t.column "contact_name",      :string
    t.column "contactemail",      :string
    t.column "contact_phone",     :string
    t.column "org",               :string
    t.column "event_start",       :datetime
    t.column "event_end",         :datetime
    t.column "location",          :string
    t.column "reservation_start", :datetime
    t.column "reservation_end",   :datetime
    t.column "memo",              :text
    t.column "oracle_string",     :string
  end

  create_table "event_roles", :force => true do |t|
    t.column "event_id",  :integer, :null => false
    t.column "member_id", :integer, :null => false
    t.column "role",      :string,  :null => false
  end

  add_index "event_roles", ["event_id"], :name => "event_roles_event_id_index"
  add_index "event_roles", ["member_id"], :name => "event_roles_member_id_index"
  add_index "event_roles", ["role"], :name => "event_roles_role_index"

  create_table "eventdates", :force => true do |t|
    t.column "event_id",    :integer,  :null => false
    t.column "startdate",   :datetime, :null => false
    t.column "enddate",     :datetime, :null => false
    t.column "calldate",    :datetime, :null => false
    t.column "strikedate",  :datetime, :null => false
    t.column "description", :string,   :null => false
  end

  add_index "eventdates", ["event_id"], :name => "eventdates_event_id_index"
  add_index "eventdates", ["startdate"], :name => "eventdates_startdate_index"
  add_index "eventdates", ["enddate"], :name => "eventdates_enddate_index"
  add_index "eventdates", ["description"], :name => "eventdates_description_index"

  create_table "eventdates_locations", :id => false, :force => true do |t|
    t.column "eventdate_id", :integer, :null => false
    t.column "location_id",  :integer, :null => false
  end

  create_table "events", :force => true do |t|
    t.column "title",           :string,   :default => "",                :null => false
    t.column "organization_id", :integer,  :default => 0,                 :null => false
    t.column "status",          :string,   :default => "Initial Request", :null => false
    t.column "contactemail",    :string
    t.column "blackout",        :boolean,  :default => false,             :null => false
    t.column "updated_on",      :datetime
    t.column "publish",         :boolean,  :default => false
    t.column "rental",          :boolean,                                 :null => false
    t.column "year_id",         :integer,                                 :null => false
    t.column "contact_name",    :string,   :default => "",                :null => false
    t.column "contact_phone",   :string,   :default => "",                :null => false
    t.column "price_quote",     :integer
    t.column "comments",        :text
  end

  add_index "events", ["title"], :name => "events_title_index"
  add_index "events", ["status"], :name => "events_status_index"
  add_index "events", ["contactemail"], :name => "events_contactemail_index"

  create_table "invoice_items", :force => true do |t|
    t.column "memo",               :string,  :null => false
    t.column "category",           :string,  :null => false
    t.column "price_recognized",   :integer, :null => false
    t.column "price_unrecognized", :integer, :null => false
  end

  add_index "invoice_items", ["category"], :name => "invoice_items_category_index"

  create_table "invoice_lines", :force => true do |t|
    t.column "invoice_id", :integer, :null => false
    t.column "memo",       :string,  :null => false
    t.column "category",   :string,  :null => false
    t.column "price",      :float
    t.column "quantity",   :integer, :null => false
  end

  add_index "invoice_lines", ["invoice_id"], :name => "invoice_lines_invoice_id_index"

  create_table "invoices", :force => true do |t|
    t.column "created_at",    :datetime
    t.column "event_id",      :integer,  :null => false
    t.column "status",        :string,   :null => false
    t.column "recognized",    :boolean,  :null => false
    t.column "payment_type",  :string,   :null => false
    t.column "oracle_string", :string,   :null => false
  end

  add_index "invoices", ["event_id"], :name => "invoices_event_id_index"

  create_table "journals", :force => true do |t|
    t.column "created_at", :datetime
    t.column "date",       :datetime,                                                :null => false
    t.column "memo",       :string,                                                  :null => false
    t.column "link_id",    :integer
    t.column "amount",     :decimal,  :precision => 9, :scale => 2, :default => 0.0, :null => false
    t.column "date_paid",  :datetime
    t.column "notes",      :text
    t.column "account_id", :integer,                                :default => 1,   :null => false
  end

  add_index "journals", ["link_id"], :name => "journals_link_id_index"

  create_table "locations", :force => true do |t|
    t.column "building", :string, :null => false
    t.column "floor",    :string, :null => false
    t.column "room",     :string, :null => false
    t.column "details",  :text
  end

  create_table "member_filters", :force => true do |t|
    t.column "name",         :string,  :default => "new filter", :null => false
    t.column "filterstring", :string
    t.column "displaylimit", :integer, :default => 0,            :null => false
    t.column "member_id",    :integer,                           :null => false
  end

  create_table "members", :force => true do |t|
    t.column "namefirst",                 :string,                 :null => false
    t.column "namelast",                  :string,                 :null => false
    t.column "kerbid",                    :string,                 :null => false
    t.column "namenick",                  :string,                 :null => false
    t.column "phone",                     :string,                 :null => false
    t.column "aim",                       :string,                 :null => false
    t.column "crypted_password",          :string,   :limit => 40, :null => false
    t.column "salt",                      :string,   :limit => 40, :null => false
    t.column "created_at",                :datetime
    t.column "updated_at",                :datetime
    t.column "remember_token",            :string
    t.column "remember_token_expires_at", :datetime
    t.column "settingstring",             :string
    t.column "title",                     :string
    t.column "callsign",                  :string
    t.column "shirt_size",                :string,   :limit => 20
  end

  add_index "members", ["namefirst"], :name => "members_namefirst_index"
  add_index "members", ["namelast"], :name => "members_namelast_index"
  add_index "members", ["kerbid"], :name => "members_kerbid_index"

  create_table "members_roles", :id => false, :force => true do |t|
    t.column "member_id", :integer, :limit => 10, :null => false
    t.column "role_id",   :integer, :limit => 10, :null => false
  end

  add_index "members_roles", ["role_id"], :name => "roles_users_FKIndex1"
  add_index "members_roles", ["member_id"], :name => "roles_users_FKIndex2"

  create_table "organizations", :force => true do |t|
    t.column "name",      :string,  :default => "", :null => false
    t.column "parent_id", :integer
  end

  add_index "organizations", ["name"], :name => "organizations_name_index"

  create_table "pagers", :force => true do |t|
    t.column "pagertype",     :string,  :null => false
    t.column "connectionstr", :string,  :null => false
    t.column "member_id",     :integer, :null => false
    t.column "priority",      :integer, :null => false
  end

  create_table "pages", :force => true do |t|
    t.column "created_on", :datetime
    t.column "message",    :text,     :null => false
    t.column "priority",   :integer,  :null => false
    t.column "member_id",  :integer,  :null => false
  end

  create_table "permissions", :force => true do |t|
    t.column "pattern", :string
  end

  create_table "permissions_roles", :id => false, :force => true do |t|
    t.column "role_id",       :integer, :limit => 10, :null => false
    t.column "permission_id", :integer, :limit => 10, :null => false
  end

  add_index "permissions_roles", ["permission_id"], :name => "permissions_roles_FKIndex1"
  add_index "permissions_roles", ["role_id"], :name => "permissions_roles_FKIndex2"

  create_table "roles", :force => true do |t|
    t.column "name", :string, :limit => 40, :null => false
    t.column "info", :string, :limit => 80, :null => false
  end

  create_table "timecard_entries", :force => true do |t|
    t.column "member_id",    :integer
    t.column "hours",        :float
    t.column "billed",       :datetime
    t.column "eventdate_id", :integer
  end

  create_table "years", :force => true do |t|
    t.column "description", :string,                 :null => false
    t.column "active",      :integer, :default => 0, :null => false
  end

end
