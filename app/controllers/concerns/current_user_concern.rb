module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: 'Guest User',
                   first_name: 'User',
                   email: 'test@example.com'
                  )
  end
end
