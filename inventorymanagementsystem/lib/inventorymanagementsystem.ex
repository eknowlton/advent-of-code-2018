defmodule InventoryManagementSystem do
  def find_correct_box_string_ids() do
    parse_input()
    |> Enum.reduce(
      {nil, nil},
      fn current_word, {last_word, next_word} ->
        case result do
          {nil, nil} -> {current_word, nil}
          {current_word, nil} -> {}
        end
      end
    )
  end

  def find_string_id_off_by_one(in_list, string_id) do
    Enum.reduce(
      false,
      fn current_word, result ->

      end
    )
  end

  # correct checksum is 4712
  def checksum(in_list) do
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
