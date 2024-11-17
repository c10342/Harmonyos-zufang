// 设计稿总宽度
const DEFAULT_WIDTH = 360;
// AppStorage.get('windowWidth') 只能在真机中使用
const windowWidth = (AppStorage.get('windowWidth') as number) || 300

// 将元素在设计稿中的大小转化为真机中的大小
export function rvp(val: number) {
  //x = 元素在设计稿大小 / 设计稿总宽度 * 真机宽度
  return val / DEFAULT_WIDTH * windowWidth
}