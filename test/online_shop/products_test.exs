defmodule OnlineShop.ProductsTest do
  use OnlineShop.DataCase

  alias OnlineShop.Products

  describe "books" do
    alias OnlineShop.Products.Book

    import OnlineShop.ProductsFixtures

    @invalid_attrs %{author: nil, year: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Products.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Products.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{author: "some author", year: 42}

      assert {:ok, %Book{} = book} = Products.create_book(valid_attrs)
      assert book.author == "some author"
      assert book.year == 42
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{author: "some updated author", year: 43}

      assert {:ok, %Book{} = book} = Products.update_book(book, update_attrs)
      assert book.author == "some updated author"
      assert book.year == 43
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_book(book, @invalid_attrs)
      assert book == Products.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Products.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Products.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Products.change_book(book)
    end
  end

  describe "movies" do
    alias OnlineShop.Products.Movie

    import OnlineShop.ProductsFixtures

    @invalid_attrs %{genre: nil, title: nil, year: nil}

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert Products.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert Products.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      valid_attrs = %{genre: "some genre", title: "some title", year: 42}

      assert {:ok, %Movie{} = movie} = Products.create_movie(valid_attrs)
      assert movie.genre == "some genre"
      assert movie.title == "some title"
      assert movie.year == 42
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      update_attrs = %{genre: "some updated genre", title: "some updated title", year: 43}

      assert {:ok, %Movie{} = movie} = Products.update_movie(movie, update_attrs)
      assert movie.genre == "some updated genre"
      assert movie.title == "some updated title"
      assert movie.year == 43
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_movie(movie, @invalid_attrs)
      assert movie == Products.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = Products.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> Products.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = Products.change_movie(movie)
    end
  end
end
