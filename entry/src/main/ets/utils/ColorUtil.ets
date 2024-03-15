
import { Constant } from './Constant';

/**
 * 给颜色设置透明度
 * @param color 原颜色色值
 * @param alpha 要设置成的透明度
 * @returns 
 */
export function applyAlphaToColor(color: string, alpha: number): string {
  const startIndex = (color.length == 7 ? 1 : 3);
  // 解析颜色值的 RGB 分量
  const r = parseInt(color.slice(startIndex, startIndex + 2), 16);
  const g = parseInt(color.slice(startIndex + 2, startIndex + 4), 16);
  const b = parseInt(color.slice(startIndex + 4, startIndex + 6), 16);
  // 将透明度限制在 0 到 1 之间
  const clampedAlpha = Math.max(0, Math.min(1, alpha));
  // 将 RGB 分量转换为带透明度的 rgba 格式
  return `rgba(${r}, ${g}, ${b}, ${clampedAlpha})`;
}

/**
 * 根据涨跌额/涨跌幅返回对应颜色
 * @param range
 * @returns
 */
export function getColorByRange(range: string): string {
  if (!range || '' === range.trim() || '--' === range || '-.-' === range || '-' === range) {
    return Constant.COLOR_PLATE;
  }
  range = range.replace('%', '');
  const value = parseFloat(range);
  if (value > 0) {
    return Constant.COLOR_UP;
  } else if (value < 0) {
    return Constant.COLOR_DOWN;
  }
  return Constant.COLOR_PLATE;
}