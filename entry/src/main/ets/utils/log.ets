import hilog from '@ohos.hilog';

export const logInfo = (data: object | string | number | Array<object | string | number>) => {
  let message = data
  if (typeof data !== 'string') {
    message = JSON.stringify(data)
  }
  hilog.info(0x0000, 'app', '%{public}s', message);
}


export const logError = (data: object | string | number | Array<object | string | number>) => {
  let message = data
  if (typeof data !== 'string') {
    message = JSON.stringify(data)
  }
  hilog.error(0x0000, 'app', '%{public}s', message);
}