import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cosmic_edu, CosmicEduWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "cqCghiYCmEKQvRGMbIw+a3RoHSEqATphXAlsbWYZk094yfWujLxVC+O8PcbD21hO",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
