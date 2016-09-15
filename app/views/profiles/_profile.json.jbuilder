json.extract! profile, :id, :user_id, :first_name, :last_name, :age, :location, :occupation, :gender, :marital_status, :share, :created_at, :updated_at
json.url profile_url(profile, format: :json)