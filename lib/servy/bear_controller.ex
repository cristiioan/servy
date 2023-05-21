defmodule Servy.BearController do
  alias Servy.Conv
  alias Servy.Wildthings
  alias Servy.Bear
  alias Servy.BearView

  @templates_path Path.expand("templates", File.cwd!())

  # defp bear_item(bear) do
  #  "<li>#{bear.name} - #{bear.type}</li>"
  # end

  def index(conv) do
    bears =
      Wildthings.list_bears()
      |> Enum.sort(&Bear.order_asc_by_name/2)

    %{conv | status: 200, resp_body: BearView.index(bears)}
  end

  def show(conv, %{"id" => id}) do
    bear = Wildthings.get_bear(id)

    %{conv | status: 200, resp_body: BearView.show(bear)}
  end

  def create(%Conv{params: %{"name" => name, "type" => type}} = conv) do
    %{conv | status: 201, resp_body: "Created a #{type} bear named #{name}!"}
  end

  def delete(conv) do
    %{conv | status: 403, resp_body: "Deleting a bear is forbidden!"}
  end
end
