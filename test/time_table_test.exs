defmodule TimeTableTest do
  use ExUnit.Case
  doctest Mamebus.TimeTable

  import Mamebus.TimeTable

  describe ".response_to_list/1" do
    test "separate by \r\n" do
      assert response_to_list({:ok, Enum.join(~w(a,b,c 1,2,3 4,5,6), "\r\n")}) == [~w(a b c), ~w(1 2 3), ~w(4 5 6)]
    end

    test "separate by \r" do
      assert response_to_list({:ok, Enum.join(~w(a,b,c 1,2,3 4,5,6), "\r")}) == [~w(a b c), ~w(1 2 3), ~w(4 5 6)]
    end

    test "separate by \n" do
      assert response_to_list({:ok, Enum.join(~w(a,b,c 1,2,3 4,5,6), "\n")}) == [~w(a b c), ~w(1 2 3), ~w(4 5 6)]
    end
  end
end
