defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file(file)
  end

  defp handle_file({:ok, result}), do
    # result = String.split(result, ",")
    # result = Enum.map(result, fn number -> String.to_interger(number) end)
    # result = Enum.sum(result)
    # result
    # We needed to type result many times due to immutability
    # Elixir is a functional language and it's data wont change in memory
    # That's exactly the use of the Pipe Operator
    result =
      result
      |> String.split(",")
      |> Stream.map(fn number -> String.to_interger(number) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_file({:error, reason}), do: {:error, %{message: "Invalid file!"}}
end
