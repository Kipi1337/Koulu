defmodule PeriodicTimer do
  use GenServer

  # Client API

  def start_link(period, func) do
    GenServer.start_link(__MODULE__, {period, func}, name: __MODULE__)
  end

  def stop_timer(pid) do
    GenServer.cast(pid, :stop)
  end

  # Server Callbacks

  def init({period, func}) do
    schedule_timer(period)
    {:ok, {period, func}}
  end

  def handle_info(:tick, {period, func}) do
    case func.() do
      :ok ->
        schedule_timer(period)
        {:noreply, {period, func}}

      :cancel ->
        IO.puts("Timer stopped via function return.")
        {:stop, :normal, {period, func}}
    end
  end

  def handle_cast(:stop, state) do
    IO.puts("Timer manually stopped.")
    {:stop, :normal, state}
  end

  defp schedule_timer(period) do
    Process.send_after(self(), :tick, period)
  end
end
