# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Pipeline::Application.config.secret_key_base = '4f0b913a9eed1e44df38d7c8990ffcf3623fe88475176f50163d7ff58e3a945e4b98b475fefd4b60f12329b658985b8535b26c7ea0e2455607466af966199c9e'
