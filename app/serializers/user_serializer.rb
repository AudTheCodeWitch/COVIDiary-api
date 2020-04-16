class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name,
             :last_name,
             :email,
             :birth_date,
             :occupation,
             :essential?,
             :isolation_start,
             :isolation_end,
             :about
  has_many :entries
end
