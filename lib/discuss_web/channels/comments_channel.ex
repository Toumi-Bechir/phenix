defmodule Discuss.CommentsChannel do
  use DiscussWeb, :channel
  #use Phoenix.Channel
  alias Discuss.Topic.Topic
  alias Discuss.UsrComment.Comment
  alias Discuss.Topic.Topic
  alias Discuss.Repo
  #alias Discuss.Ecto


  def join("comments:" <> topic_id, _params, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Topic
    |>Repo.get(topic_id)
    |>Repo.preload(comments: [:user])

    IO.puts("++++++++topic++++++ok+++++")
    IO.inspect(topic)
    IO.puts("+++++++++topic+++++ok+++++")
    {:ok, %{comments: topic.comments}, assign(socket, :topic, topic)}
end



def handle_in(name, %{"content" => content}, socket) do

    topic = socket.assigns.topic

    changeset = topic
      |> Ecto.build_assoc(:comments, user_id: socket.assigns.user_id)
      |>Comment.changeset(%{content: content})

    case Repo.insert(changeset) do
      {:ok, comment} ->
      broadcast!(socket, "comment:#{socket.assigns.topic.id}:new", %{comment: comment})

        {:reply, :ok, socket}
      {:error, _reason} ->
        {:reply, {:error, %{errors: changeset}}, socket}

end
      IO.puts("++reply+++++++ok+++++")

      #IO.inspect(message)
      #{:reply, :ok, socket}
    end
end
