defmodule OnlineShop.Release do
  @moduledoc """
  Used for executing DB release tasks when run in production without Mix
  installed.
  """
  @app :online_shop

  def migrate do
    create_db()
    load_app()

    for repo <- repos() do
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end
  end

  def rollback(repo, version) do
    load_app()
    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  defp repos do
    Application.fetch_env!(@app, :ecto_repos)
  end

  defp load_app do
    Application.load(@app)
  end

  defp create_db do
    # Start postgrex and ecto
    IO.puts("Starting dependencies...")

    # Start apps necessary for executing migrations
    Application.ensure_all_started(@app)
    create_db_for(@app)

    IO.puts("createdb task done!")
  end

  def create_db_for(app) do
    for repo <- get_repos(app) do
      :ok = ensure_repo_created(repo)
    end
  end

  defp ensure_repo_created(repo) do
    IO.puts("create #{inspect(repo)} database if it doesn't exist")

    case repo.__adapter__.storage_up(repo.config) do
      :ok -> :ok
      {:error, :already_up} -> :ok
      {:error, term} -> {:error, term}
    end
  end

  # defp migrate() do
  #   IO.puts("Start running migrations..")
  #   Enum.each(@myapps, &run_migrations_for/1)
  #   IO.puts("migrate task done!")
  # end

  # defp run_migrations_for(app) do
  #   IO.puts("Running migrations for '#{app}'")

  #   for repo <- get_repos(app) do
  #     {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
  #   end

  #   IO.puts("Finished running migrations for '#{app}'")
  # end

  defp get_repos(app) do
    Application.load(app)
    Application.fetch_env!(app, :ecto_repos)
  end
end
