OmniAuth.config.test_mode = true

identity_hash = {
  provider: "identity",
  uid: "9372",
  info: {
    first_name: "Bob",
    last_name: "Billy",
    email: "bibblybob@wavetronix.com",
    location: "Billy Bob's Emporium",
    description: "Owner, manager and all around good guy"
  }
}

OmniAuth.config.add_mock(:identity, identity_hash)
