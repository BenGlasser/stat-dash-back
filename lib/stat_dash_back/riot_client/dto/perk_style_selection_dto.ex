defmodule StatDashBack.RiotClient.DTO.PerkStyleSelectionDto do
  @moduledoc """
  Documentation for PerkStyleSelectionDto.
  """

  defstruct [:perk, :var1, :var2, :var3]

  @type t :: %__MODULE__{
          perk: Integer.t(),
          var1: Integer.t(),
          var2: Integer.t(),
          var3: Integer.t()
        }

  def from_map(%{} = perk_style_selection) do
    %__MODULE__{
      perk: Map.get(perk_style_selection, :perk, Map.get(perk_style_selection, "perk")),
      var1: Map.get(perk_style_selection, :var1, Map.get(perk_style_selection, "var1")),
      var2: Map.get(perk_style_selection, :var2, Map.get(perk_style_selection, "var2")),
      var3: Map.get(perk_style_selection, :var3, Map.get(perk_style_selection, "var3"))
    }
  end

  def new([perk: perk, var1: var1, var2: var2, var3: var3]) do
    %__MODULE__{
      perk: perk,
      var1: var1,
      var2: var2,
      var3: var3
    }
  end
end
