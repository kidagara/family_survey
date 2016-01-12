OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity,
            fields: [:first_name, :last_name, :email],
            on_failed_registration: lambda { |env|
              IdentitiesController.action(:new).call(env)
            }
end
