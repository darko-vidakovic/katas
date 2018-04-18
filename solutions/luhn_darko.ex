defmodule Luhn do
  @num_digits_without_control 10
  
  def validate(num) do
    length(num) == @num_digits_without_control + 1 
      && double(num) 
          |> Enum.sum 
          |> rem(10) == 0;
  end

  defp double([single]), do: [single]
  defp double([]), do: []
  defp double([e, o | t]) do
    [Integer.digits(2 * e) |> Enum.sum, o | double(t)]
  end

  def generate() do
    numbers = Enum.take_random(0..9, @num_digits_without_control)
    sum = double(numbers) |> Enum.sum
    control = 10 - rem(sum, 10) |> rem(10)
    numbers ++ [control]
  end
end
