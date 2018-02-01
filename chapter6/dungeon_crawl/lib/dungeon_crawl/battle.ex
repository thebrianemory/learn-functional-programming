defmodule DungeonCrawl.Battle do
  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  def fight(
        character_a = %{hit_points: hit_points_a},
        character(b = %{hit_points: hit_points_b})
      )
      when hit_points_a == 0 or hit_points_b == 0,
      do: {character_a, character_b}

  def fight(character_a, character_b) do
    character_b_after_damage = attack(character_a, character_b)
    character_a_after_damage = attack(character_b, character_a)
    fight(character_a_after_damage, character_b_after_damage)
  end

  defp attack(%{hit_points: hit_points_a}, character_b) when hit_points_a == 0, do: character_b

  defp attack(character_a, character_b) do
    damage = Enum.random(character_a.damage_range)
    character_b_after_damage = Character.take_damage(character_b, damage)

    character_a
    |> attack_message(damage)
    |> Shell.info()

    character_b_after_damage
    |> receive_message(damage)
    |> Shell.info()

    character_b_after_damage
  end

  defp attack_message(character = %{name: "You"}, damage) do
    "You attack with #{character.attack_description} and deal #{damage} damage."
  end

  defp receive_message(character = %{name: "You"}, damage) do
    "You receive #{damage}. Current HP: #{character.hit_points}"
  end

  defp receive_message(character, damage) do
    "#{character.name} receives #{damage}. Current HP: #{character.hit_points}"
  end
end
