defmodule JellyWeb.GameLive do
  use JellyWeb, :live_view

  # challenges = {instructions: board_answer_opts}

  def mount(params, session, socket) do
    challenge1 = %{
      instruction: "Find the atoms:",
      correct: [":yum", "true", ":false", ":\"has spaces\""],
      incorrect: ["hi", "3", "9", "maybe", "grr"]
    }

    game_board = [
      [%{choice: ":yum"}, %{choice: "true"}, %{choice: ":\"has spaces\""}],
      [%{choice: "hi"}, %{choice: "3"}, %{choice: "9"}],
      [%{choice: "maybe"}, %{choice: "grr"}, %{choice: ":false"}]
    ]

    new_socket =
      socket
      |> assign(:game_board, game_board)
      |> assign(:challenge, challenge1)


    {:ok, new_socket}
  end

  def render(assigns) do
    ~H"""

    <h1 class="text-center">Instructions:</h1>
      <p class="text-center"><%= @challenge.instruction %></p>
    <div class="flex flex-col items-center mx-auto bg-red-500">
    <.button >PLAY!</.button>
    <div class="grid grid-cols-3 w-5/6 mx-auto text-center bg-board">
      <%= for row <- @game_board do %>
        <%= for cell <- row do %>
          <div class="aspect-square border-black border-dotted border-2">
          <%= cell.choice %>
          </div>
        <% end %>
      <% end %>

      </div>
    </div>
    """
  end

  def win() do
  end
end

# game_board \\ [[%{}, %{}, %{}],
#               [%{}, %{}, %{}],
#               [%{}, %{}, %{}]]
