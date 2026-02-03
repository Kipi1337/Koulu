def call(conn, {:error, %Ecto.Changeset{}}) do
  conn
  |> put_status(:unprocessable_entity)
  |> put_view(BooksApiWeb.ErrorView)
  |> render(:"422")
end
