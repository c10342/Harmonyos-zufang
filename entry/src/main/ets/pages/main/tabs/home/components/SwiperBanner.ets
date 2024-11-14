import { HomeBannerItem } from '../../../../../api';

@Component
export default struct SwiperBanner {
  @Prop list: HomeBannerItem[] = [];

  build() {
    Swiper() {
      ForEach(this.list, (item: HomeBannerItem) => {
        Image(item.imageURL).width('100%').height('100%').objectFit(ImageFit.Fill)
      }, (item: HomeBannerItem) => `${item.id}`)
    }
    .width('100%')
    .height(211)
    .loop(true)
    .autoPlay(true)
    .interval(5000)
    .indicator(
      // 设置导航点样式
      Indicator.dot().color('#CCCBCB').selectedColor($r('app.color.primary'))
    )
  }
}