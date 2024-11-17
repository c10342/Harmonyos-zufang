// 实现了 IDataSource 接口
// 接口要求我们必须定义四个方法：getData、totalCount、registerDataChangeListener、unregisterDataChangeListener
export class BaseDataSource<T> implements IDataSource {
  // 内部用来触发UI更新对象
  private listeners: DataChangeListener[] = [];
  // 管理数据
  private originDataArray: T[] = [];

  // 返回数据总长度
  public totalCount(): number {
    return 0;
  }

  // 读取对应下标的数据
  public getData(index: number): T {
    return this.originDataArray[index];
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

export class CommonDataSource<T> extends BaseDataSource<T> {
  dataArray: T[] = [];

  getData(index: number): T {
    return this.dataArray[index];
  }

  totalCount(): number {
    return this.dataArray.length;
  }

  // 添加数据到指定位置
  addData(index: number, data: T): void {
    this.dataArray.splice(index, 0, data);
    // 通知数据有新增
    this.notifyDataAdd(index);
  }

  // 添加数据到列表最后面
  pushData(data: T): void {
    this.dataArray.push(data);
    // 通知数据有新增
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  // 批量添加数据
  pushBatchData(list: T[]) {
    list.forEach(item => {
      this.pushData(item)
    })
  }
}