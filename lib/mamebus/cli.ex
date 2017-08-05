defmodule Mamebus.CLI do
  @routes Application.get_env(:mamebus, :routes)

  def get_route_names do
    @routes |> Enum.map(fn %{desc: desc} -> desc end)
  end
end
