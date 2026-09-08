import Mathlib

-- Day20-03 分层次审视 Day8 度量：静态自距 vs 动态自距
-- 原 Day8：d(x,x)=ε（自距留差，一刀切）
-- 分层次二选一：对象层静态自距=0 / 动作层动态自距=ε

def dynamic_self_distance (ε : ℝ) : ℝ := ε

-- 定理1：对象层静态自距=0（静态对象自距为零，Day8 可能遗漏的一路）
theorem static_self_distance_zero (x : ℝ) : x - x = 0 := by
  ring

-- 定理2：动作层动态自距=ε（测量动作留差，Day8 已焊的一路）
theorem dynamic_self_distance_is_epsilon (ε : ℝ) : dynamic_self_distance ε = ε := by
  unfold dynamic_self_distance
  rfl

-- 定理3：层间分离——静态自距=0（对象层）、动态自距=ε（动作层），两路不冲突
theorem static_dynamic_separation (x ε : ℝ) :
    (x - x = 0) ∧ (dynamic_self_distance ε = ε) := by
  constructor
  · exact static_self_distance_zero x
  · exact dynamic_self_distance_is_epsilon ε
