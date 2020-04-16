class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :health_rating,
             :symptoms_present?,
             :health_comments,
             :mental_health_rating,
             :mental_health_comments,
             :diary_entry,
             :created_at
  belongs_to :user
end
