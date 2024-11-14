export interface BaseRespond<T=any>{
  "code": number,
  "message": string,
  data:T
}

export interface HomeBannerItem{
  "id":number
  "name":string
  "imageURL": string
}

export  interface HomeNavItem{
  "id": number
  "title": string
  "imageURL": string
}

export  interface  HomeTileItem{
  "id": number
  "imageURL": string
  "title": string
  "sub_title": string
}

export interface HomePlanItem{
  "id":number
  "imageURL":string
}

export interface HomeData{
  bannerList:HomeBannerItem[],
  navList:HomeNavItem[],
  tileList:HomeTileItem[],
  planList:HomePlanItem[],
  adPicture:string;
}