import FindTab from './tabs/find/Index'
import HomeTab from './tabs/home/Index'
import LikeTab from './tabs/like/Index'
import MyTab from './tabs/my/Index'
import ServiceTab from './tabs/service/Index'

@Entry
@Component
struct MainPage {
  @State currentIndex: number = 0;

  @Builder
  tabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .width(28)
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? $r('app.color.black') : '#a0a0a0')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Tabs({ barPosition: BarPosition.End ,index:this.currentIndex}) {
      TabContent() {
        HomeTab()
      }
      .tabBar(this.tabBuilder('首页', 0, $r('app.media.tabbar_home_active'), $r('app.media.tabbar_home')))

      TabContent() {
        LikeTab()
      }
      .tabBar(this.tabBuilder('想看', 1, $r('app.media.tabbar_see_active'), $r('app.media.tabbar_see')))

      TabContent() {
        ServiceTab()
      }
      .tabBar(this.tabBuilder('服务', 2, $r('app.media.tabbar_service_active'), $r('app.media.tabbar_service')))

      TabContent() {
        FindTab()
      }
      .tabBar(this.tabBuilder('发现', 3, $r('app.media.tabbar_discover_active'), $r('app.media.tabbar_discover')))

      TabContent() {
        MyTab()
      }
      .tabBar(this.tabBuilder('我的', 4, $r('app.media.tabbar_my_active'), $r('app.media.tabbar_my')))
    }
    .barMode(BarMode.Fixed)
    .scrollable(false)
    .width('100%')
    .height('100%')
    .barHeight(50)
    .backgroundColor($r('app.color.white'))
    .onChange((index: number) => {
      this.currentIndex = index
    })
  }
}