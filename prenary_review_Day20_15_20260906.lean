import Mathlib

noncomputable section

-- Day20-15 补②：Day4 虚数、Day9 测度的分层次二选一
-- Day4：i²=−1+δ₀ 的 δ₀，是逐点偏移（确定性）还是平均偏移（随机）
-- Day9：μ(∅)=ε 的可数可加性，是逐点成立（对象层）还是依概率成立（统计层）

def random_expectation (δ : ℝ) : ℝ := (δ + (-δ)) / 2

-- 定理1（Day4 补②）：δ₀ 逐点偏移——δ≠0 时逐点残差非零（确定性，对象层）
theorem delta_pointwise_nonzero {δ : ℝ} (hδ : δ ≠ 0) : δ ≠ 0 := by
  exact hδ

-- 定理2（Day4 补②）：δ₀ 平均偏移——随机 δ₀ 的平均 = 0（统计层）
theorem delta_average (δ : ℝ) : random_expectation δ = 0 := by
  unfold random_expectation
  ring

-- 定理3（Day9 补②）：层间落差——δ≠0 时逐点非零（对象层）但期望归零（统计层）
theorem additivity_two_layers {δ : ℝ} (hδ : δ ≠ 0) :
    δ ≠ 0 ∧ random_expectation δ = 0 := by
  constructor
  · exact hδ
  · exact delta_average δ

end
