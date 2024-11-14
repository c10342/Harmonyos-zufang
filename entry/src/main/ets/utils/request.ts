import axios, { AxiosInstance, AxiosRequestConfig } from '@ohos/axios';
import { BaseRespond } from '../api/types';
import promptAction from '@ohos.promptAction';


class Request {
  private instance!: AxiosInstance;

  constructor() {
    this.init()
  }

  service(options: AxiosRequestConfig): any {
    return this.instance.request(options)
  }

  get<T = any>(url: string, data?: any): Promise<BaseRespond<T>> {
    return this.service({
      url,
      data,
      method: 'get'
    })
  }

  post<T = any>(url: string, params?: any): Promise<BaseRespond<T>> {
    return this.service({
      url,
      params,
      method: 'post'
    })
  }

  private init() {
    this.instance = axios.create({
      baseURL: 'http://localhost:6060'
    });
    // 请求拦截
    // this.instance.interceptors.request.use((config) => {
    //   return config
    // })
    // 响应拦截
    this.instance.interceptors.response.use((response) => {
      if (response.data.code === 200) {
        return response.data
      }
      promptAction.showToast({
        message: response.data?.message || '请求失败',
        duration: 2000
      });
      return Promise.reject(response.data);
    })
  }
}

export const request = new Request()