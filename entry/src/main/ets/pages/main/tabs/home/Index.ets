import { getHomeData, HomeBannerItem, HomeNavItem, HomePlanItem, HomeTileItem } from '../../../../api';

import Ad from './components/Ad';
import NavList from './components/NavList';
import PlanList from './components/PlanList';
import RoomRecommend from './components/RoomRecommend';
import SearchBar from './components/SearchBar';
import SwiperBanner from './components/SwiperBanner';
import TileList from './components/TileList';

@Component
export default struct HomeTab {
  @State bannerList: HomeBannerItem[] = []
  @State navList: HomeNavItem[] = []
  @State tileList: HomeTileItem[] = []
  @State planList: HomePlanItem[] = []
  @State adPicture: string = ''
  // 记录页面滚动的距离
  scrollY = 0
  // searchbar的背景色和字体色
  @State bgColor: string = 'rgba(255, 255, 255, 0)'
  @State fontColor: string = 'rgb(255, 255, 255)'

  aboutToAppear() {
    this.getData();
  }

  async getData() {
    const res = await getHomeData()
    this.bannerList = res.data.bannerList
    this.navList = res.data.navList
    this.tileList = res.data.tileList
    this.planList = res.data.planList
    this.adPicture = res.data.adPicture
  }

  build() {
    Stack() {
      Scroll() {
        Column() {
          SwiperBanner({ list: this.bannerList })
          NavList({ list: this.navList })
          TileList({ list: this.tileList })
          PlanList({ list: this.planList })
          Ad({ adPicture: this.adPicture })
          RoomRecommend()
        }.padding({ bottom: 24 })
      }
      .width('100%')
      .height('100%')
      .onDidScroll(this.onDidScroll.bind(this))

      // 搜索栏
      SearchBar({
        fontColor: this.fontColor,
        bgColor: this.bgColor
      })
    }.alignContent(Alignment.TopStart).width('100%').height('100%')

  }

  onDidScroll(xOffset: number, yOffset: number) {
    // xOffset，yOffset 每次滚动的距离
    this.scrollY += yOffset
    if (this.scrollY < 0) {
      this.scrollY = 0
    }

    // 计算颜色
    if (this.scrollY > 10) {
      // scrollY可能达不到0，需要给点误差
      // 滚动到顶部
      this.bgColor = 'rgba(255, 255, 255, 1)'
      this.fontColor = 'rgb(0, 0, 0)'
    } else {
      this.bgColor = 'rgba(255, 255, 255, 0)'
      this.fontColor = 'rgb(255, 255, 255)'
    }
  }
}