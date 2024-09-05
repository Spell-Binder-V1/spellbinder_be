# Use the official Ruby image as the base image
FROM ruby:3.2

# Set environment variables
ENV RAILS_ENV=production
ENV RACK_ENV=production

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN bundle install

# Copy the rest of the application
COPY . .

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose the port the app runs on
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "s"]
