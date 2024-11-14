import { HomeBannerItem } from '../../../../api';
import { getHomeData } from '../../../../api/modules';
import SearchBar from './components/SearchBar';
import SwiperBanner from './components/SwiperBanner';

@Component
export default struct HomeTab {
  @State bannerList: HomeBannerItem[] = []

  aboutToAppear() {
    this.getData();
  }

  async getData() {
    const res = await getHomeData()
    this.bannerList = res.data.bannerList
  }

  build() {
    Column() {
      Stack() {
        SwiperBanner({ list: this.bannerList })
        SearchBar()
      }.alignContent(Alignment.TopStart)
    }
    .width('100%')
    .height('100%')

  }
}