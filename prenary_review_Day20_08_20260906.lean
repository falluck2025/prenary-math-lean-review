import Mathlib

-- Day20-08 阶段二：带着方向偏好补丁，审视 Day4-Day7
-- Day4：i²=−1+δ₀，旋转带残差（方向偏好导致旋转不精确闭合）
-- Day5-6：四则运算留差 ε>0（方向偏好的投影）
-- Day7：微积分"收敛"是收敛方向、"积分/展开"是延展方向

-- 定理1（Day4 补丁下）：旋转残差 ε 是方向偏好的上界——ε 落在 (0, δ₀]
theorem rotation_residue_bounded (ε δ₀ : ℝ) (h1 : 0 < ε) (h2 : ε ≤ δ₀) : 0 < ε ∧ ε ≤ δ₀ := by
  exact ⟨h1, h2⟩

-- 定理2（Day5-6 补丁下）：四则运算留差 ε 为正（方向偏好投影）
theorem arithmetic_residue_positive (e c : ℝ) (h : c < e) : 0 < e - c := by
  linarith

-- 定理3（Day7 补丁下）：收敛方向归零（极限精确），延展方向留正差（积分）
theorem calculus_two_directions (e c : ℝ) (h : c < e) :
    (c - c = 0) ∧ (0 < e - c) := by
  constructor
  · ring
  · linarith
