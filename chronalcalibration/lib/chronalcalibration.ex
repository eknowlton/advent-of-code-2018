defmodule ChronalCalibration do
  def calibrate(in_list, now, frequencies) when now in frequencies do
    now
  end

  def calibrate((head | tail), now, frequencies) do
    calibrate(tail, now + head, [now + head] + frequencies)
  end

  def calibrate([], now, frequencies) do
    parse_input()
    |> calibrate(frequencies)
  end

  def parse_input do
    File.stream!('input.txt')
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.to_list
  end
end
