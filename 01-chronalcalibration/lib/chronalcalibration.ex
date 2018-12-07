defmodule ChronalCalibration do
  def run do
    parse_input() |> calibrate(0, [])
  end

  def calibrate([head | tail], now, frequencies) do
    frequency = now + head
    if frequency in frequencies do
      frequency
    else
      calibrate(tail, frequency, [frequency] ++ frequencies)
    end
  end

  def calibrate([], now, frequencies) do
    parse_input()
    |> calibrate(now, frequencies)
  end

  def parse_input do
    File.stream!('input.txt')
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.to_list
  end
end
