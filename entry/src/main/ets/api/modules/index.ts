import { request } from "../../utils";
import { HomeData } from "../types";

export const getHomeData = ()=>request.get<HomeData>('/home/info')