Factory.define :user do |u|
  u.uid { Factory(:identity).id }
  u.provider "identity"
  u.first_name "Steven"
  u.last_name "Tyler%d"
  u.email { |o| "#{o.name.parameterize('.')}@wavetronix.com" }
end
