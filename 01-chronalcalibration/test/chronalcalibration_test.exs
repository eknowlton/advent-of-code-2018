defmodule ChronalCalibrationTest do
  use ExUnit.Case
  doctest ChronalCalibration

  test "calibrates time" do
    assert [1, -2, 3] |> ChronalCalibration.calibrate() == 2
  end
end
