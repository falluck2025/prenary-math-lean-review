import Mathlib

-- Day20-04 分层次审视 Day13 单位元：延展 +ε vs 收敛 −ε（方向双路）
-- 原 Day13：单位元偏移 0→−ε（单一方向）
-- 分层次二选一：延展方向偏移 +ε / 收敛方向偏移 −ε

def unit_offset_convergent (ε : ℝ) : ℝ := -ε
def unit_offset_expansive (ε : ℝ) : ℝ := ε

-- 定理1：收敛方向单位元偏移 −ε（Day13 已焊的一路）
theorem convergent_unit_offset (ε : ℝ) : unit_offset_convergent ε = -ε := by
  unfold unit_offset_convergent
  rfl

-- 定理2：延展方向单位元偏移 +ε（Day13 可能遗漏的一路）
theorem expansive_unit_offset (ε : ℝ) : unit_offset_expansive ε = ε := by
  unfold unit_offset_expansive
  rfl

-- 定理3：方向双路——延展 +ε 与收敛 −ε 是"方向偏好"在单位元上的投影，两路并存
theorem unit_offset_two_directions (ε : ℝ) :
    (unit_offset_expansive ε = ε) ∧ (unit_offset_convergent ε = -ε) := by
  constructor
  · exact expansive_unit_offset ε
  · exact convergent_unit_offset ε
