class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :first_name,
             :last_name,
             :email,
             :birth_date,
             :occupation,
             :is_essential,
             :isolation_start,
             :isolation_end,
             :about
  has_many :entries
end
