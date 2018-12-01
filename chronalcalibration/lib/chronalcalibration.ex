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
    |> Enum.to_list
  end

  def hello do
    f = 0
    File.stream!("input.txt")
    |> Stream.map(fn x -> x + f end)
    |> IO.puts
  end

end
