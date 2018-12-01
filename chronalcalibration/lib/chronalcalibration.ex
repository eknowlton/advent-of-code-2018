defmodule ChronalCalibration do
  def calibrate(in_list) do
    in_list
    |> Enum.reduce(fn x, acc -> acc + x end)
  end

  def parse_input do
    File.stream!('input.txt')
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.to_list
  end
end
