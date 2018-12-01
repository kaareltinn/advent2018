{:ok, data} = File.read("inputs.txt")

result = data
         |> String.trim
         |> String.split("\n")
         |> Enum.map(&String.to_integer(&1))
         |> Enum.sum

IO.puts(result)
