defmodule Discuss.CommentsChannel do
  use DiscussWeb, :channel
  #use Phoenix.Channel


  def join(name, _params, socket) do
    {:ok, %{ayya: "Wenek"}, socket}
    end

    def handle_in(name, message, socket) do
      IO.puts("++++++++++++++")
      IO.puts(name)
      IO.inspect(message)
      {:reply, :ok, socket}
    end
end
