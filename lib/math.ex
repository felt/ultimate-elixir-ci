defmodule UltimateElixirCI.Math do
  @moduledoc "Various mathematical helpers"

  @doc """
  An implementation of C's fmod() --- modular division on floating point values

  Example:

    iex> Float.round(UltimateElixirCI.Math.fmod(9.87654321, 9), 3)
    0.877
  """
  @spec fmod(float, number) :: float
  def fmod(input, max) when is_float(input) do
    input - max * trunc(input / max)
  end

  @doc """
  The world's worst implementation to generate the nth Fibonacci number.

  Example:

    iex> UltimateElixirCI.Math.fibonacci(10)
    55
  """
  @spec fibonacci(integer) :: integer
  def fibonacci(0), do: 0
  def fibonacci(1), do: 1
  def fibonacci(n), do: fibonacci(n - 1) + fibonacci(n - 2)
end
