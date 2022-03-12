defmodule UltimateElixirCI.MathTest do
  use ExUnit.Case, async: true
  doctest UltimateElixirCI.Math
  alias UltimateElixirCI.Math

  test "does floating point mod" do
    assert Float.round(Math.fmod(1.234, 9), 3) == 1.234
    assert Float.round(Math.fmod(9.234, 9), 3) == 0.234
    assert Float.round(Math.fmod(10.234, 9), 3) == 1.234
    assert Float.round(Math.fmod(-9.123, 9), 3) == -0.123

    assert Float.round(Math.fmod(18.5, 4.2), 1) == 1.7
    assert Float.round(Math.fmod(-5.1, 3.0), 1) == -2.1
  end

  # This takes a second or two, so let's not run it every $ mix test
  @tag integration: true
  test "calculates Fibonacci numbers" do
    assert UltimateElixirCI.Math.fibonacci(40) == 102_334_155
  end
end
