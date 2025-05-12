source "https://rubygems.org"

# =============================
#  Core Rails & Base système
# =============================
gem "rails"
gem "pg"
gem "puma"

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
  gem "dotenv-rails"
  gem "annotate"
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
end

# =============================
#  Non utilisés actuellement
# =============================
# gem "jbuilder"
# gem "bcrypt", "~> 3.1.7"
# gem "solid_cache"
# gem "solid_queue"
# gem "solid_cable"
