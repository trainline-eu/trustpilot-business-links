FROM ruby:2.4

# System dependencies: Add here any librairies needed for certain gems
RUN apt-get update \
  && apt-get install -y libpq-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Application working directory
WORKDIR /home/trustpilot-business-links

# WARNING The following line is important to keep bundle config
# inside the app directory
ENV  BUNDLE_APP_CONFIG /home/trustpilot-business-links/.bundle/
# Copy dependency file
COPY ./trustpilot-business-links-client.gemspec /home/trustpilot-business-links/trustpilot-business-links-client.gemspec
COPY ./lib/trustpilot-business-links/version.rb /home/trustpilot-business-links/lib/trustpilot-business-links/version.rb
COPY ./Gemfile /home/trustpilot-business-links/Gemfile

# Ensure UTF8 strings can be used
ENV LANG C.UTF-8

# Bundle
RUN bundle install

# Copy code
COPY ./ /home/trustpilot-business-links

# What to launch on container startup
ENTRYPOINT ["make"]
CMD        ["run"]
