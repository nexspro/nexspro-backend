source "https://rubygems.org"

# =============================
#  Core Rails & Base système
# =============================
gem "rails"
gem "pg"
gem "puma"
gem "rodauth-rails"
# =============================
#  Performance & Initialisation
# =============================
gem "bootsnap", require: false

# =============================
#  API & Communication externe
# =============================
gem "rack-cors"
gem "blueprinter"

# =============================
#  Environnement : Production
# =============================
group :production do
end

# =============================
#  Environnement : Développement
# =============================
group :development do
  gem "rubocop-rails-omakase", require: false
  gem "brakeman", require: false
  gem "ruby-lsp-rails"
end

# =============================
#  Environnement : Test
# =============================
group :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
end

# =============================
#  Environnement partagé : Dev & Test
# =============================
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "dotenv-rails"
end

# =============================
#  Non utilisés actuellement
# =============================
# gem "jbuilder"
# gem "bcrypt", "~> 3.1.7"
# gem "solid_cache"
# gem "solid_queue"
# gem "solid_cable"
# Enables Sequel to use Active Record's database connection
gem "sequel-activerecord_connection", "~> 2.0", require: false
# Used by Rodauth for password hashing
gem "bcrypt", "~> 3.1", require: false
# Used by Rodauth for JWT support
gem "jwt", "~> 2.9", require: false
# Used by Rodauth for rendering built-in view and email templates
gem "tilt", "~> 2.4", require: false
