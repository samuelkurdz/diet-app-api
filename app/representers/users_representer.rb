class UsersRepresenter
  def initialize(users)
    @users = users
  end

  def as_json
    users.map do |user|
      puts user
      {
        id: user.id,
        email: user.email,
        userName: user.userName,
        lastName: user.lastName,
        firstName: user.firstName,
        country_name: user.country.name,
        country_alpha2_code: user.country.alpha2_code,
        country_alpha3_code: user.country.alpha3_code,
        created_at: user.created_at,
        updated_at: user.updated_at
      }
    end
    
  end

  private
  attr_reader :users
end
