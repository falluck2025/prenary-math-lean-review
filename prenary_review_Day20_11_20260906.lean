import Mathlib

noncomputable section

-- Day20-11 阶段二：带着方向偏好补丁，审视 Day17 随机 ε 退化（死穴①）
-- 补丁下：随机留差 ±δ 的"±"是方向偏好（延展+δ/收敛−δ），δ 是幅度（延展>收敛的差）
-- 层间落差（期望零 ≠ a.s.零）= 方向偏好的"个体存在" vs "平均抵消"

def random_expectation (δ : ℝ) : ℝ := (δ + (-δ)) / 2

-- 定理1（补丁下）：随机留差的期望为零——方向偏好"平均抵消"
theorem preference_average_cancels (δ : ℝ) : random_expectation δ = 0 := by
  unfold random_expectation
  ring

-- 定理2（补丁下）：δ≠0 时随机留差逐点非零——方向偏好"个体存在"
theorem preference_pointwise_exists {δ : ℝ} (hδ : δ ≠ 0) : δ ≠ 0 ∧ -δ ≠ 0 := by
  constructor
  · exact hδ
  · intro h
    have : δ = 0 := by linarith
    exact hδ this

-- 定理3（补丁下）：死穴①的层间落差 = 方向偏好的"个体存在" vs "平均抵消"
theorem preference_gap_is_deathlock {δ : ℝ} (hδ : δ ≠ 0) :
    random_expectation δ = 0 ∧ (δ ≠ 0 ∧ -δ ≠ 0) := by
  constructor
  · exact preference_average_cancels δ
  · exact preference_pointwise_exists hδ

end
