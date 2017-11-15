defmodule Mamebus.CLI do
  def main(argv) do
    argv
    |> parse_args()
    |> process()
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv,
      switches: [
        route: :integer,
        show_routes: :boolean,
        help: :boolean
      ],
      aliases: [
        r: :route,
        s: :show_routes,
        h: :help
      ]
    )

    case parse do
    {[route: index], [], []} -> {:route, index}
    {[show_routes: true], [], []} -> :show_routes
    {[help: true], _, _} -> :help
    _ -> :help
    end
  end

  def process({:route, index}) do
    Mamebus.TimeTable.routes()
    |> Enum.at(index - 1)
    |> Mamebus.TimeTable.fetch
    |> show_time_table
  end

  def process(:show_routes) do
    Mamebus.TimeTable.route_names()
    |> Enum.reduce(1, fn (name, n) ->
      index = String.pad_leading(Integer.to_string(n), 2)
      IO.puts "    #{index}. #{name}"
      n + 1
    end)
  end

  def process(:help) do
    IO.puts("""
        --route, -r       show time table
        --show-routes, -s show all routes
        --help, -h        show usage help (this text)
    """)
  end

  def show_time_table(%{desc: desc, table: table}) do
    IO.puts(desc)
    put_table(table)
  end

  def show_time_table(%{desc: desc, tables: tables}) do
    IO.puts(desc)
    Enum.each(tables, &put_table/1)
  end

  defp rule(table) do
    column_count = table |> List.first() |> Enum.count()
    table |> List.insert_at(1, List.duplicate("---", column_count))
  end

  defp put_table(table) do
    IO.puts("")
    table |> rule() |> Enum.each(fn row -> IO.puts("| #{Enum.join(row, " | ")} |") end)
  end
end
