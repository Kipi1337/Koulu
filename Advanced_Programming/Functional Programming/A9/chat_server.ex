defmodule ChatServer do
  use GenServer

  # Client API
  def start(port) do
    IO.puts("Server starting on port #{port}...")
    {:ok, _pid} = GenServer.start_link(__MODULE__, %{clients: %{}, port: port}, name: __MODULE__)
    listen_for_connections(port)  # Start listening for client connections
  end

  defp listen_for_connections(port) do
    {:ok, listen_socket} = :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])
    IO.puts("Server is ready to accept connections on port #{port}")
    accept_connections(listen_socket)
  end

  defp accept_connections(listen_socket) do
    {:ok, socket} = :gen_tcp.accept(listen_socket)
    IO.puts("Accepted new connection")

    # Handle the new connection in a separate process
    spawn(fn -> handle_client(socket) end)
    accept_connections(listen_socket)  # Keep accepting new connections
  end

  defp handle_client(socket) do
    IO.puts("Handling client...")

    # Receive the client's name
    name = receive_name(socket)

    # Register the client
    GenServer.cast(__MODULE__, {:add_client, name, socket})

    # Listen for messages from the client
    listen_for_messages(socket, name)

    # Handle client disconnection
    :gen_tcp.close(socket)
  end

  defp receive_name(socket) do
    {:ok, name} = :gen_tcp.recv(socket, 0)
    name = String.trim(name)
    IO.puts("Client #{name} has joined.")
    name
  end

  defp listen_for_messages(socket, name) do
    case :gen_tcp.recv(socket, 0) do
      {:ok, message} ->
        message = String.trim(message)
        IO.puts("Received message from #{name}: #{message}")
        broadcast_message(name, message)
        listen_for_messages(socket, name)

      {:error, :closed} ->
        IO.puts("Client #{name} has disconnected.")
    end
  end

  defp broadcast_message(sender, message) do
    GenServer.cast(__MODULE__, {:broadcast_message, sender, message})
  end

  # Server Callbacks

  def init(state) do
    {:ok, state}
  end

  def handle_cast({:add_client, name, socket}, state) do
    new_clients = Map.put(state.clients, name, socket)
    {:noreply, %{state | clients: new_clients}}
  end

  def handle_cast({:broadcast_message, sender, message}, state) do
    # Broadcast the message to all clients except the sender
    Enum.each(state.clients, fn {client_name, client_socket} ->
      if client_name != sender do
        :gen_tcp.send(client_socket, "#{sender}: #{message}\n")
      end
    end)
    {:noreply, state}
  end
end
