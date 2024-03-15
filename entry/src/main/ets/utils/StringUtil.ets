export function removeChineseCharacters(range: string): string {
  // 使用正则表达式匹配中文字符，并将其替换为空字符串
  return range.replace(/[\u4E00-\u9FA5]/g, '');
}

export function getPrice(range: string) {
  if (!range || '' === range.trim() || '--' === range || '-.-' === range || '-' === range) {
    return '--';
  }
  if (range.startsWith('-') || range.startsWith('+')) {
    return range;
  }
  const originRange = range;
  range = removeChineseCharacters(range).replace('%', '');
  const value = parseFloat(range);
  if (value > 0) {
    return '+' + originRange;
  } else if (value < 0) {
    return '-' + originRange;
  }
  return originRange;
}