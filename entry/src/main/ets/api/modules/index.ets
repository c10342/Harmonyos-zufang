import { request } from '../../utils';
import { HomeData, HouseItem } from '../types';

export const getHomeData = () => request.get<HomeData>('home/info')

export const getNearbyHouses = () => request.get<HouseItem[]>('house/nearbyHouses')