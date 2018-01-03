defmodule Exercise.ChapterThree.MatchstickFactory do
  def boxes(matchsticks) do
    [big, big_leftover] = [div(matchsticks, 50), rem(matchsticks, 50)]
    [medium, med_leftover] = [div(big_leftover, 20), rem(big_leftover, 20)]
    [small, remaining_matchsticks] = [div(med_leftover, 5), rem(med_leftover, 5)]
    %{big: big, medium: medium, small: small, remaining_matchsticks: remaining_matchsticks}
  end
end
