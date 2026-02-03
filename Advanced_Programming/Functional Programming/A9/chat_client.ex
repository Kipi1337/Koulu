defmodule ChatClient do
  def start(host, port) do
    {:ok, socket} = :gen_tcp.connect(String.to_charlist(host), port, [:binary, packet: :line, active: false])

    IO.write("Enter your name:\n> ")
    name = IO.gets("") |> String.trim()

    :gen_tcp.send(socket, name <> "\n")  # Send the name to the server

    spawn(fn -> listen_for_messages(socket) end)  # Start listening for messages
    send_messages(socket)  # Start sending messages to the server
  end

  defp send_messages(socket) do
    loop_send(socket)
  end

  defp loop_send(socket) do
    IO.write("> ")
    message = IO.gets("") |> String.trim()
    :gen_tcp.send(socket, message <> "\n")  # Send the message to the server
    loop_send(socket)
  end

  defp listen_for_messages(socket) do
    case :gen_tcp.recv(socket, 0) do
      {:ok, data} ->
        # Clear the prompt line before printing the received message
        IO.write("\r> #{String.trim(data)}\n")  # Print the received message properly
        listen_for_messages(socket)  # Continue listening for messages

      {:error, :closed} ->
        IO.puts("Disconnected from server.")
    end
  end
end
