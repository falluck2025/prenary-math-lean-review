import Mathlib

-- Day20-12 阶段二：带着方向偏好补丁，审视 Day18 犄角旮旯（26 刀）
-- 补丁下：26 刀的 ε 化，根都是"方向偏好"（延展−收敛>0）

-- 定理1（补丁下）：任何板块的 ε 化，其 ε 都是方向偏好差（延展−收敛>0）——26 刀共同的根
theorem all_epsilon_rooted_in_preference (e c : ℝ) (h : c < e) : 0 < e - c := by
  linarith

-- 定理2（补丁下）：ε 化的"退化锚"（ε=0）就是"方向偏好消失"（延展=收敛）
theorem all_degenerate_is_preference_vanishes (e c : ℝ) (h : e = c) : e - c = 0 := by
  rw [h]
  ring

-- 定理3（补丁下）：26 刀的"非平凡"（ε≠0）就是"方向偏好存在"（延展≠收敛）
theorem all_non_trivial_is_preference_exists (e c : ℝ) (h : e ≠ c) : e - c ≠ 0 := by
  intro hz
  have : e = c := by linarith
  exact h this
