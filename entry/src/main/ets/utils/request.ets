import axios, { AxiosInstance, AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import { BaseRespond } from '../api/types';
import promptAction from '@ohos.promptAction';


class Request {
  private instance: AxiosInstance;

  constructor() {
    this.instance = axios.create({
      baseURL: 'http://localhost:6060'
    });
    this.init()
  }

  service<T = object>(options: AxiosRequestConfig): Promise<BaseRespond<T>> {
    return this.instance.request(options)
  }

  get<T = object>(url: string, data?: object): Promise<BaseRespond<T>> {
    return this.service<T>({
      url,
      data,
      method: 'get'
    })
  }

  post<T = object>(url: string, params?: object): Promise<BaseRespond<T>> {
    return this.service<T>({
      url,
      params,
      method: 'post'
    })
  }

  private init() {
    // 请求拦截
    // this.instance.interceptors.request.use((config) => {
    //   return config
    // })
    // 响应拦截
    this.instance.interceptors.response.use((response: AxiosResponse) => {
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