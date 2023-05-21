defmodule Servy.Conv do
  defstruct headers: %{},
            method: "",
            params: %{},
            path: "",
            resp_body: "",
            resp_headers: %{"Content-Type" => "text/html"},
            status: nil

  def status_full(status) do
    "#{status} #{status_reason(status)}"
  end

  defp status_reason(code) do
    %{
      200 => "OK",
      201 => "Created",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not Found",
      500 => "Internal Server Error"
    }[code]
  end

  def put_resp_content_type(%{resp_headers: resp_headers} = conv, type) do
    headers = Map.put(resp_headers, "Content-Type", type)
    %{conv | resp_headers: headers}
  end

  def put_content_length(%{resp_headers: resp_headers, resp_body: resp_body} = conv) do
    headers = Map.put(resp_headers, "Content-Length", byte_size(resp_body))
    %{conv | resp_headers: headers}
  end
end
