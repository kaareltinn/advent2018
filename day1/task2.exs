{:ok, data} = File.read("inputs.txt")

changes = data
         |> String.trim
         |> String.split("\n")
         |> Enum.map(&String.to_integer(&1))

initial = {
  %{
    0 => 1
  },
  0
}

stream = Stream.cycle(changes)
Stream.transform(stream, initial, fn i, {state, current} ->
  current_state = Map.update(state, current + i, 1, &(&1 + 1))
  if Map.fetch!(current_state, current+i) >= 2 do
    {:halt, {current_state, current + i}}
  else
    {[current+i], {current_state, current + i}}
  end
end)
|> Enum.to_list()
|> List.last()
|> IO.puts
