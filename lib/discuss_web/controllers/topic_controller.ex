defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller


  alias Discuss.Example
  alias Discuss.Example.Topic
  alias Discuss.Topic.Topic
  alias Discuss.Repo
  #alias Discuss.Ecto

  def index(conn, _params) do
    topics = Repo.all(Topic)
    IO.inspect(topics)
    render(conn, "index.html", topics: topics)
  end


  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic_params}) do

  #changeset = Topic.changeset(%Topic{}, topic_params)
  changeset = conn.assigns.current_user
  |>Ecto.build_assoc(:topics)
  |>Topic.changeset(topic_params)
      case Repo.insert(changeset) do
      {:ok, topic} ->
        conn
        |> put_flash(:info, "Topic created successfully.")
        |> redirect(to: Routes.topic_path(conn, :index))

        {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    topic = Repo.get!(Topic, id)
    IO.puts("++++++++++++Show+++++++++")
    IO.inspect(topic)
    IO.puts("++++++++++++Show++++++++++")
    render(conn, "show.html", topic: topic)
  end

  def edit(conn, %{"id" => id}) do
    topic = Repo.get!(Topic, id)
    changeset = Topic.changeset(topic)
    render(conn, "edit.html", topic: topic, changeset: changeset)
  end

  def update(conn, %{"id" => id, "topic" => topic_params}) do
    topic = Repo.get!(Topic,id)
    changeset = Repo.get(Topic, id) |> Topic.changeset(topic_params)
    case Repo.update(changeset) do
      {:ok, _topic} ->
      conn
        |> put_flash(:info, "Topic created successfully.")
        |> redirect(to: Routes.topic_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", topic: topic, changeset: changeset)
    end
    #topic = Repo.get(Topic, id)

    #case Repo.update(topic, topic_params) do
      #{:ok, topic} ->
        #conn
        #|> put_flash(:info, "Topic updated successfully.")
        #|> redirect(to: Routes.topic_path(conn, :show, topic))

      #{:error, %Ecto.Changeset{} = changeset} ->
        #render(conn, "edit.html", topic: topic, changeset: changeset)
    #end
  end

  def delete(conn, %{"id" => id}) do
    topic = Repo.get!(Topic, id)
    {:ok, _topic} = Repo.delete(topic)

    conn
    |> put_flash(:info, "Topic deleted successfully.")
    |> redirect(to: Routes.topic_path(conn, :index))
  end
end
