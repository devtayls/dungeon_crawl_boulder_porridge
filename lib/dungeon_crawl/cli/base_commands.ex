defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def display_options(opts) do
    opts
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info('#{index} - #{option}')
    end)

    opts
  end

  def generate_question(opts) do
    opts = Enum.join(1..Enum.count(opts), ",")
    "Which one? [#{opts}]\n"
  end

  def parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end
end
