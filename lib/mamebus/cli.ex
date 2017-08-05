defmodule Mamebus.CLI do
  def main(argv) do
    argv
    |> parse_args()
    |> process()
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv,
      switches: [
        routes: :boolean,
        help: :boolean
      ],
      aliases: [
        r: :routes,
        h: :help
      ]
    )

    case parse do
    {[routes: true], _, _} -> :routes
    {[help: true], _, _} -> :help
    _ -> :help
    end
  end

  def process(:routes) do
    Mamebus.TimeTable.route_names()
    |> Enum.reduce(1, fn (name, n) ->
      index = String.pad_leading(Integer.to_string(n), 2)
      IO.puts "    #{index}. #{name}"
      n + 1
    end)
  end

  def process(:help) do
    IO.puts("""
        --routes, -r   show all routes
        --help, -h     show usage help (this text)
    """)
  end
end
