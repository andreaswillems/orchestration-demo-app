# OnlineShop

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Build Docker image

```bash
# in the root of the project's directory
$ docker build -t online-shop:0.1 .
```

## Run Docker image

```bash
$ docker run -it --rm -e PHX_SERVER=true -e SECRET_KEY_BASE -e DATABASE_URL=ecto://postgres:postgres@host.docker.internal:5432/online_shop_dev -p 4000:4000 online-shop:0.1
```

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
