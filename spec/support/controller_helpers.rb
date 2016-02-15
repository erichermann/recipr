module ControllerHelpers
  def login_with(user, scope = :user)
    user = double('user') unless user.nil?

    if user.nil?
      login_with_no_user(scope)
    else
      login_with_user(user, scope)
    end
  end

  def login_with_no_user(scope)
    allow(request.env['warden']).to receive(:authenticate!)
      .and_throw(:warden, scope: scope)
    allow(controller).to receive(current_user(scope)).and_return(nil)
  end

  def login_with_user(user, scope)
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(current_user(scope)).and_return(user)
  end

  def current_user(scope)
    "current_#{scope}".to_sym
  end
end
