defmodule Mamebus.TimeTable do
  @url Application.get_env(:mamebus, :url)
  @files Application.get_env(:mamebus, :files)

  def fetch_all do
    @files |> Enum.map(&fetch/1)
  end

  def fetch(%{desc: desc, name: filename}) do
    %{desc: desc, table: fetch_table(filename)}
  end

  def fetch(%{desc: desc, names: filenames}) do
    %{
      desc: desc,
      tables: Enum.map(filenames, &fetch_table/1)
    }
  end

  def fetch_table(filename) do
    "#{@url}#{filename}"
    |> HTTPoison.get()
    |> handle_response()
    |> response_to_list()
  end

  def handle_response({:ok, %{status_code: 200, body: body}}) do
    {:ok, body}
  end

  def handle_response({_, %{status_code: status_code, body: body}}) do
    {:error, %{status_code: status_code, body: body}}
  end

  def response_to_list({:ok, body}) do
    body
    |> String.trim()
    |> String.split("\r\n")
    |> CSV.decode
    |> Enum.map(fn {:ok, row} -> row end)
  end
end
