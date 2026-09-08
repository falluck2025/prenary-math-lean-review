import Mathlib

-- Day20-09 阶段二：带着方向偏好补丁，审视 Day8-Day13

-- 定理1（Day8/9 补丁下）：测量/测度动作留正差（方向偏好 → 自距/空集留差 ε>0）
theorem measure_action_preference (e c : ℝ) (h : c < e) : 0 < e - c := by
  linarith

-- 定理2（Day12 补丁下）：方向偏好不改变拓扑——加 ε 是平移，差不变（洞还在）
theorem topology_preserved (e c ε : ℝ) : (e + ε) - (c + ε) = e - c := by
  ring

-- 定理3（Day13 补丁下）：单位元偏移的方向 = 方向偏好（延展 +ε、收敛 −ε）
def unit_offset_expansive (ε : ℝ) : ℝ := ε
def unit_offset_convergent (ε : ℝ) : ℝ := -ε

theorem unit_offset_directions (ε : ℝ) :
    (unit_offset_expansive ε = ε) ∧ (unit_offset_convergent ε = -ε) := by
  constructor
  · unfold unit_offset_expansive
    rfl
  · unfold unit_offset_convergent
    rfl
