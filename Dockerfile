# Elixir + Phoenix

FROM elixir:1.16.1

# Install debian packages
RUN apt-get update
RUN apt-get install --yes build-essential inotify-tools postgresql-client bash

# Install Phoenix packages
RUN mix local.hex
RUN mix local.rebar --force 
RUN mix archive.install hex phx_new 

WORKDIR /app
ADD . /app
EXPOSE 4000

ENTRYPOINT [ "mix", "phx.server" ]
