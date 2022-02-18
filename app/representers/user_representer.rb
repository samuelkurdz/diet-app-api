class UserRepresenter
  def initialize(user)
    @user = user
  end

  def as_json
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

  private
  attr_reader :user
end
