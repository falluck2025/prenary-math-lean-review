import Mathlib

-- Day20-01 方向偏好公理补丁（路 A：延展 > 收敛）
-- 补丁公理：延展 > 收敛（方向偏好），ε = 延展 − 收敛 > 0（正性从推导）

-- 定理1：补丁公理下 ε 为正（延展 − 收敛 > 0）
theorem epsilon_positive (expansion contraction : ℝ) (h : contraction < expansion) :
    0 < expansion - contraction := by
  linarith

-- 定理2：ε 的正性推出 ε ≠ 0（减法不可清零的正版本）
theorem epsilon_nonzero (expansion contraction : ℝ) (h : contraction < expansion) :
    expansion - contraction ≠ 0 := by
  linarith

-- 定理3：同向"相减"归零（expansion − expansion = 0）
-- 注意：方向二态本为"标签"（expansion/contraction 二值构造子），本不可相减；
--   此处用 ℝ 模拟才"能减"，故"同态相减=0"是"无定义操作的占位规则"——
--   四象相变中同态是顶点、一到就转化，此规则实际不会触发（数学侧保留，不留缺漏）
theorem same_direction_zero (expansion : ℝ) : expansion - expansion = 0 := by
  ring

-- 定理4：异向相减留正残差（延展 − 收敛 = ε > 0）
theorem opposite_direction_residue (expansion contraction : ℝ) (h : contraction < expansion) :
    0 < expansion - contraction ∧ expansion - contraction ≠ 0 := by
  constructor
  · exact epsilon_positive expansion contraction h
  · exact epsilon_nonzero expansion contraction h
