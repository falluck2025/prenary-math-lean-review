import Mathlib

-- Day20-14 补①：方向二态焊成 inductive 标签 + 偏序（延展>收敛）
-- 之前 Day20-01 用 ℝ 模拟方向二态，现在焊成真正的"标签"类型

inductive Direction where
  | contraction : Direction  -- 收敛
  | expansion : Direction    -- 延展

-- 偏序：延展 > 收敛（方向偏好公理）——用 rank 表示大小
def Direction.rank : Direction → ℕ
  | Direction.contraction => 0
  | Direction.expansion => 1

-- 定理1：延展的 rank > 收敛的 rank（方向偏好：延展 > 收敛）
theorem expansion_greater_contraction :
    Direction.rank Direction.expansion > Direction.rank Direction.contraction := by
  unfold Direction.rank
  norm_num

-- 定理2：方向二态是两个不同的标签（延展 ≠ 收敛）
theorem expansion_ne_contraction : Direction.expansion ≠ Direction.contraction := by
  intro h
  cases h
