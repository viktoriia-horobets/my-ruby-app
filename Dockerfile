# Використовуємо офіційний образ Ruby
FROM ruby:3.2

# Встановлюємо необхідні пакети
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Встановлюємо робочу директорію всередині контейнера
WORKDIR /app

# Копіюємо Gemfile та Gemfile.lock і встановлюємо gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Копіюємо решту файлів проєкту
COPY . .

# Відкриваємо порт для веб-сервера
EXPOSE 3000

# Запускаємо сервер
CMD ["rails", "server", "-b", "0.0.0.0"]
