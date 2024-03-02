ARG BUILD_DIRECTORY=/var/build
ARG DEPLOY_DIRECTORY=/var/deploy

########################################################################## build
FROM ruby:3.3.0

# Re-declare relevant build arguments.
ARG BUILD_DIRECTORY

# Copy the Gemfiles and the vendored cache to the build directory. At the time
# this Dockerfile was written, the checked-in cache directory is the source of
# truth for some internal Teachstone applications.
COPY Gemfile Gemfile.lock "${BUILD_DIRECTORY}"
COPY vendor/cache "${BUILD_DIRECTORY}/cache/"

# Copy the application source, respecting .dockerignore.
COPY --chown=teachstone:teachstone . "${DEPLOY_DIRECTORY}"

# Copy the bundle from the build stage.
COPY --from=build \
  --chown=teachstone:teachstone \
  "${BUILD_DIRECTORY}/bundle" \
  "${DEPLOY_DIRECTORY}/vendor/bundle"

######################################################################### server
FROM base AS server

EXPOSE 3000

# For the server, we do not override entrypoint. Instead, we specify a default
# command.
CMD [ "bundler", "exec", "puma", "-C", "config/puma.rb" ]
