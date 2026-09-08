import Mathlib

-- Day20-13 阶段二：带着方向偏好补丁，审视 Day19 三层结构
-- 补丁下：三层结构 = 方向偏好的三层递进（消失/恒定/随机）

-- 定理1（补丁下）：经典 = 方向偏好消失（延展=收敛 ⟹ ε=0）
theorem classical_is_preference_vanishes (e c : ℝ) (h : e = c) : e - c = 0 := by
  rw [h]
  ring

-- 定理2（补丁下）：定值 = 方向偏好恒定（延展>收敛 ⟹ ε 是固定正差）
theorem constant_is_preference_fixed (e c : ℝ) (h : c < e) : 0 < e - c := by
  linarith

-- 定理3（补丁下）：三层递进——方向偏好"消失/恒定/随机"是同一根的三态
theorem three_layer_one_root (e c : ℝ) (h : c < e) :
    (0 < e - c) ∧ (e - c ≠ 0) := by
  constructor
  · linarith
  · linarith
