defmodule MamebusTest do
  use ExUnit.Case
  doctest Mamebus

  test "greets the world" do
    assert Mamebus.hello() == :world
  end
end
