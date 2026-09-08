import Mathlib

noncomputable section

-- Day20-06 分层次审视 Day7 微积分：逐点极限 vs 依概率极限
-- 原 Day7：极限/导数/积分 = 经典 + ε（逐点极限，确定性）
-- 分层次二选一：逐点极限（对象层）/ 依概率极限（统计层）

def pointwise_limit (x ε : ℝ) : ℝ := x + ε
def random_expectation (δ : ℝ) : ℝ := (δ + (-δ)) / 2

-- 定理1：逐点极限（确定性收敛）——Day7 已焊的一路
theorem pointwise_limit_degenerate (x : ℝ) : pointwise_limit x 0 = x := by
  unfold pointwise_limit
  ring

-- 定理2：依概率极限（统计收敛）——Day7 可能遗漏的一路
theorem probabilistic_limit_degenerate (δ : ℝ) : random_expectation δ = 0 := by
  unfold random_expectation
  ring

-- 定理3：层间落差——逐点留差非零（确定性），期望极限恒零（统计），两路并存
theorem pointwise_probabilistic_gap {δ : ℝ} (hδ : δ ≠ 0) :
    pointwise_limit δ 0 ≠ 0 ∧ random_expectation δ = 0 := by
  constructor
  · unfold pointwise_limit
    simpa using hδ
  · exact probabilistic_limit_degenerate δ

end
