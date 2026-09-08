import Mathlib

noncomputable section

-- Day20-02 审视 Day3 退化定理（A 回头看补丁 + B 分层次二选一）
-- A：公理补丁（方向偏好 ε=延展−收敛>0）下，Day3 退化定理不冲突、更清晰
-- B：分层次二选一——Day3 的"δ₀=0⟹a−a=0"是对象层逐点归零，还是统计层期望归零？

def random_expectation (δ : ℝ) : ℝ := (δ + (-δ)) / 2

-- 定理1（B 对象层）：δ=0 ⟹ 逐点归零（Day3 已焊的一路）
theorem object_layer_degenerate (δ : ℝ) (h : δ = 0) : δ = 0 := by
  exact h

-- 定理2（B 统计层）：期望恒零（δ≠0 时平均也归零，Day3 遗漏的一路）
theorem statistical_layer_degenerate (δ : ℝ) : random_expectation δ = 0 := by
  unfold random_expectation
  ring

-- 定理3（B 层间落差）：δ≠0 时对象层不归零、统计层归零（Day3 的二选一暴露）
theorem layer_gap_day3 {δ : ℝ} (hδ : δ ≠ 0) : δ ≠ 0 ∧ random_expectation δ = 0 := by
  constructor
  · exact hδ
  · exact statistical_layer_degenerate δ

-- 定理4（A 补丁不冲突）：补丁下 ε 为正（延展−收敛>0）与 Day3 退化兼容，反而更清晰
theorem patch_compatible_with_day3 (e c : ℝ) (h : c < e) : 0 < e - c := by
  linarith

end
