class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :health_rating,
             :is_symptomatic,
             :health_comments,
             :mental_health_rating,
             :mental_health_comments,
             :diary_entry,
             :is_public,
             :created_at
  belongs_to :user
end
