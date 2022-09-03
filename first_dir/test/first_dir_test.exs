defmodule FirstDirTest do
  use ExUnit.Case
  doctest FirstDir

  test "greets the world" do
    assert FirstDir.hello() == :world
  end
end
