defmodule InventoryManagementSystem do
  def run do
    parse_input()
    |> checksum()
  end

  def checksum(in_list) do
    with_two = 0
    with_three = 0

    Enum.map(
      in_list,
      fn string_id ->
        count_occurences(string_id)
      end
    )
    |> Enum.map(fn x ->
      with_two =
        with_two +
          Enum.find_value(
            x,
            0,
            fn x ->
              if x >= 2 do
                1
              end
            end
          )

      with_three =
        with_three +
          Enum.find_value(
            x,
            0,
            fn x ->
              if x >= 3 do
                1
              end
            end
          )
    end)

    with_two * with_three
  end

  def count_occurences(string_id) do
    string_id
    |> String.graphemes()
    |> Enum.reduce(
      %{},
      fn char, accum ->
        Map.update(accum, char, 1, &(&1 + 1))
      end
    )
  end

  def parse_input do
    File.stream!('input.txt')
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end
end
