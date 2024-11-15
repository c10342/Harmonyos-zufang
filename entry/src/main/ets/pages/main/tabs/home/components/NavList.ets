import { HomeNavItem } from '../../../../../api';

@Component
export default struct NavList {
  @Prop list: HomeNavItem[] = []

  build() {
    // GridRow({ columns: 4 }) {
    //   ForEach(this.list, (item: HomeNavItem) => {
    //     GridCol() {
    //       Column() {
    //         Image(item.imageURL).width(57).height(56)
    //         Text(item.title).margin({ top: 6 }).fontSize(12)
    //           .fontColor($r('app.color.black'))
    //       }.padding({ top: 5, bottom: 5 })
    //       .width('100%')
    //     }
    //   }, (item: HomeNavItem) => `${item.id}`)
    // }
    // .width('100%')
    // .margin({ top: 24 })
    Grid() {
      ForEach(this.list, (item: HomeNavItem) => {
        GridItem() {
          Column() {
            Image(item.imageURL).width(57).height(56)
            Text(item.title).margin({ top: 6 }).fontSize(12)
              .fontColor($r('app.color.black'))
          }
        }
      }, (item: HomeNavItem) => `${item.id}`)
    }
    .rowsTemplate('1fr 1fr')
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .width('100%')
    .height(170)
    .rowsGap(10)
    .margin({ top: 24 })
  }
}