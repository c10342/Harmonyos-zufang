import { HomeBannerItem, HomeNavItem, HomePlanItem, HomeTileItem } from '../../../../api';
import { getHomeData } from '../../../../api/modules';
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
    Scroll() {
      Column() {
        Stack() {
          SwiperBanner({ list: this.bannerList })
          SearchBar()
        }.alignContent(Alignment.TopStart)

        NavList({ list: this.navList })
        TileList({ list: this.tileList })
        PlanList({ list: this.planList })
        Ad({ adPicture: this.adPicture })
        RoomRecommend()
      }
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
  }
}