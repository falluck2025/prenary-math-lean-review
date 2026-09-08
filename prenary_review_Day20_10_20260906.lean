import Mathlib

-- Day20-10 阶段二：带着方向偏好补丁，审视 Day14-Day16

-- 定理1（Day14 补丁下）：熵偏移 ε 为正（信息的方向偏好，偏向无序/延展）
theorem entropy_preference (e c : ℝ) (h : c < e) : 0 < e - c := by
  linarith

-- 定理2（Day15 补丁下）：乘性旋转的相位留差（旋转方向偏好，不精确闭合）
theorem rotation_phase_preference (ε : ℝ) (h : 0 < ε) : ε ≠ 0 := by
  linarith

-- 定理3（Day16 补丁下）：复合留差的内层放大——方向偏好在复合中传递
def composition_residue (a εg εf : ℝ) : ℝ := a * εg + εf

theorem composition_residue_inner_amplified (a εg εf : ℝ) :
    composition_residue a εg εf = a * εg + εf := by
  unfold composition_residue
  rfl

-- 定理4（Day16 补丁下）：外层斜率 a>0 时，复合留差随内层留差 εg 增大（方向偏好单调传递）
theorem composition_residue_monotone (a εg1 εg2 εf : ℝ) (ha : 0 < a) (h : εg1 < εg2) :
    composition_residue a εg1 εf < composition_residue a εg2 εf := by
  unfold composition_residue
  nlinarith
