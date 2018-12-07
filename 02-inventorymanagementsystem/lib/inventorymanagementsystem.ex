defmodule InventoryManagementSystem do
  def part_one() do
    parse_input()
    |> Enum.reduce(
      {},
      fn string_id, last ->
        find_string_id_off_by_one(string_id, last)
      end
    ) |> remove_different_character()
  end

  def remove_different_character({string_one, string_two}) do
    comparable_lists(string_one, string_two)
    |>Enum.reduce(
      [],
      fn {char_from_one, char_from_two}, result ->
        if char_from_one === char_from_two do
          result ++ [char_from_one]
        else
          result
        end
      end
    ) |> Enum.join()
  end

  def find_string_id_off_by_one(string_id, last) do
    Enum.reduce(
      parse_input(),
      last,
      fn current_word, result ->
        case difference(string_id, current_word) do
          1 -> {string_id, current_word}
          _ -> result
        end
      end
    )
  end

  def difference(string_one, string_two) do
    comparable_lists(string_one, string_two)
    |> Enum.reduce(
      0,
      fn pair, distance ->
        if elem(pair, 0) != elem(pair, 1) do
          distance + 1
        else
          distance
        end
      end
    )
  end

  def comparable_lists(string_one, string_two) do
    [String.codepoints(string_one), String.codepoints(string_two)]
    |> List.zip()
  end

  def part_two(in_list) do
    parse_input()

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
