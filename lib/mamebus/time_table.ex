defmodule Mamebus.TimeTable do
  @url "http://www.city.noda.chiba.jp/_res/projects/default_project/_page_/001/010/030/"

  @files [
    %{desc: "関宿城ルート（関宿中央ターミナル行）", name: "1607_sekiyadojo_sekiyadotyuuou-terminal_iki.csv"},
    %{desc: "関宿城ルート（関宿城博物館行）", name: "1607_sekiyadojo_sekiyadojouhakubutukan_iki2.csv"},
    %{desc: "北ルート（市役所行）", name: "1607_kita_shiyakusyo_iki_heijitu.csv"},
    %{desc: "北ルート（市役所行）", name: "1607_kita_shiyakusyo_iki_donitisyukujitu.csv"},
    %{desc: "北ルート（関宿中央ターミナル行）", name: "1607_kita_sekiyadotyuuou-terminal_iki_heijitu.csv"},
    %{desc: "北ルート（関宿中央ターミナル行）", name: "1607_kita_sekiyadotyuuou-terminal_iki_donitisyukujitu.csv"},
    %{desc: "新北ルート（市役所行）", name: "1607_shinkita_shiyakusyo_iki.csv"},
    %{desc: "新北ルート（いちいのホール行）", name: "1607_shinkita_itiino-hall_iki.csv"},
    %{desc: "中ルート（左回り）", name: "1607_naka_hidarimawari.csv"},
    %{desc: "中ルート（右回り）", name: "1607_naka_migimawari.csv"},
    %{desc: "南ルート（左回り）", name: "1607_minami_hidarimawari_heijitu.csv"},
    %{desc: "南ルート（左回り）", name: "1607_minami_hidarimawari_donitisyukujitu.csv"},
    %{desc: "南ルート（右回り）", name: "1607_minami_migimawari_heijitu.csv"},
    %{desc: "南ルート（右回り）", name: "1607_minami_migimawari_donitisyukujitu.csv"},
    %{desc: "新南ルート（みずき4丁目公園行）", name: "1607_shinminami_mizukiyontyoumekouen_iki.csv"},
    %{desc: "新南ルート（大利根温泉行）", name: "1607_shinminami_ootoneonsen_iki.csv"}
  ]

  def fetch_all do
    @files |> Enum.map(&fetch/1)
  end

  def fetch(%{desc: desc, name: filename}) do
    %{desc: desc, table: fetch_table(filename)}
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
