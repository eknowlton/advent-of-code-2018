defmodule ChronalCalibrationTest do
  use ExUnit.Case
  doctest ChronalCalibration

  test "sums the list" do
    assert [1, -2, 3] |> ChronalCalibration.hello() == 2
  end
end
