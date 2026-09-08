import Mathlib

-- Day20-07 阶段二：带着方向偏好补丁，审视 Day1-Day3
-- Day1：a−a=ε → 延展−收敛=ε>0（异态相减，正性有来源）
-- Day2：½+½=1 → 对称平衡点，补丁下被方向偏好"撑开"（差 ε）
-- Day3：δ₀=0 → 方向偏好消失（延展=收敛），ε 归零

-- 定理1（Day1 补丁下）：ε = 延展 − 收敛 > 0（正性从推导）
theorem epsilon_from_preference (e c : ℝ) (h : c < e) : 0 < e - c := by
  linarith

-- 定理2（Day2 补丁下）：对称平衡 ½+½=1 是精确的；但方向偏好下平衡被"撑开"
-- 精确平衡：1/2 + 1/2 = 1（无偏好时）
theorem symmetric_balance : (1 / 2 : ℝ) + (1 / 2 : ℝ) = 1 := by
  norm_num

-- 定理3（Day3 补丁下）：方向偏好消失（延展=收敛）⟹ ε 归零
theorem preference_vanishes_epsilon_zero (e c : ℝ) (h : e = c) : e - c = 0 := by
  rw [h]
  ring
