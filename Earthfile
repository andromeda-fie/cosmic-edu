VERSION 0.7

deps:
  ARG ELIXIR=1.16.2
  ARG OTP=26.2.3
  FROM hexpm/elixir:${ELIXIR}-erlang-${OTP}-alpine-3.19.1
  WORKDIR /src
  ENV MIX_ENV=test
  RUN apk add -y --no-cache git
  COPY mix.exs mix.lock ./
  RUN mix local.rebar --force
  RUN mix local.hex --force
  RUN yes | mix archive.install github hexpm/hex branch latest
  RUN mix deps.get
  SAVE ARTIFACT /src/deps AS LOCAL deps

build:
  FROM +deps
  RUN mix deps.compile
  COPY --dir config ./
  COPY --dir lib ./
  RUN mix compile
  SAVE ARTIFACT /src/_build AS LOCAL build

ci:
  FROM +build
  COPY .formatter.exs .
  RUN mix clean
  RUN mix compile --warning-as-errors
  RUN mix format --check-formatted

test:
  FROM +build
  COPY --dir test ./
  RUN mix test

release:
  FROM +test
  COPY priv priv
  COPY rel rel
  COPY assets assets
  RUN MIX_ENV=prod mix assets.deploy
  RUN MIX_ENV=prod mix do compile, release
  SAVE ARTIFACT /src/_build/prod/rel/cosmic_edu AS LOCAL release

docker-prod:
  FROM alpine:3.19.1
  RUN apk add libstdc++6 openssl ncurses-libs
  WORKDIR /app
  RUN chown nobody /app
  USER nobody
  COPY --dir +release/cosmic_edu .
  CMD ["./cosmic_edu/bin/server"]
  ARG GITHUB_REPO="andromeda-fie/cosmic-edu"
  SAVE IMAGE --push ghcr.io/$GITHUB_REPO:prod

docker-dev:
  FROM +build
  ARG DATABASE_URL
  ENV MIX_ENV=dev
  RUN mix deps.compile
  RUN DATABASE_URL=$DATABASE_URL mix compile
  CMD ["iex", "-S", "mix phx.server"]
  ARG GITHUB_REPO="andromeda-fie/cosmic-edu"
  SAVE IMAGE --push ghcr.io/$GITHUB_REPO:dev

docker:
  BUILD +docker-dev
  BUILD +docker-prod
