defmodule InventoryManagementSystem do
  def run do
    parse_input()
    |> checksum()
  end

  def checksum(in_list) do
    Enum.map(
      in_list,
      fn string_id ->
        count_occurences(string_id)
        |> has_two_and_three()
      end
    )
    |> Enum.reduce(
      {0, 0},
      fn word_counts, {with_two, with_three} ->
        case word_counts do
          {true, true} -> {with_two + 1, with_three + 1}
          {false, true} -> {with_two + 1, with_three}
          {true, false} -> {with_two, with_three + 1}
          _ -> {with_two, with_three}
        end
      end
    )
    |> Tuple.to_list()
    |> Enum.reduce(
      1,
      fn count, accum ->
        accum * count
      end
    )
  end

  def has_two_and_three(character_counts) do
    Map.values(character_counts)
    |> Enum.reduce(
      {false, false},
      fn count, {has_two, has_three} ->
        case count do
          2 -> {true, has_three}
          3 -> {has_two, true}
          _ -> {has_two, has_three}
        end
      end
    )
  end

  def count_occurences(string_id) do
    string_id
    |> String.codepoints()
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
