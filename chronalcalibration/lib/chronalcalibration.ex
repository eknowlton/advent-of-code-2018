defmodule ChronalCalibration do
  @moduledoc """
  Documentation for ChronalCalibration.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ChronalCalibration.hello()
      :world

  """
  def read_input
    File.stream!('input.txt')
    |> Stream.map(&String.trim/1)
    |> Stream.map(&Integer.parse/1)
    |> Enum.to_list
  end

  def hello(in_list) do
    in_list
    |> Enum.reduce(fn x, acc -> acc + x end)
  end
end
