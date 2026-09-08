import Mathlib

noncomputable section

-- Day20-05 分层次审视 Day5-6 四则运算：逐点留差 vs 期望留差
-- 原 Day5-6：四则运算 = 经典 + ε（常数 ε，逐点留差）
-- 分层次二选一：逐点留差（确定性 ε）/ 期望留差（随机 ε 的平均）

def random_expectation (δ : ℝ) : ℝ := (δ + (-δ)) / 2
def pointwise_residue (ε : ℝ) : ℝ := ε

-- 定理1：逐点留差（确定性 ε）——Day5-6 已焊的一路
theorem pointwise_residue_is_epsilon (ε : ℝ) : pointwise_residue ε = ε := by
  unfold pointwise_residue
  rfl

-- 定理2：期望留差（随机 ε 的平均）——Day5-6 可能遗漏的一路
theorem expectation_residue (δ : ℝ) : random_expectation δ = 0 := by
  unfold random_expectation
  ring

-- 定理3：层间落差——逐点留差非零（确定性），期望留差恒零（平均），两路并存
theorem pointwise_expectation_gap {δ : ℝ} (hδ : δ ≠ 0) :
    pointwise_residue δ ≠ 0 ∧ random_expectation δ = 0 := by
  constructor
  · unfold pointwise_residue
    exact hδ
  · exact expectation_residue δ

end
