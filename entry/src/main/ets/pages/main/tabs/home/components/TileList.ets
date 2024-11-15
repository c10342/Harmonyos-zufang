import { HomeTileItem } from '../../../../../api';

@Component
export default struct TileList {
  @Prop list: HomeTileItem[] = []

  build() {
    Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
      ForEach(this.list, (item: HomeTileItem) => {
        Column({ space: 8 }) {
          Image(item.imageURL).width(148).height(57)
          Row() {
            Text(item.title).fontSize(12).fontColor($r('app.color.black'))
            Text(item.sub_title).fontSize(10).fontColor($r('app.color.gray'))
          }
          .alignItems(VerticalAlign.Center)
          .justifyContent(FlexAlign.Start)
          .width('100%')
        }
        .alignItems(HorizontalAlign.Start)
        .width('50%')
      }, (item: HomeTileItem) => `${item.id}`)
    }
    .padding({ left: 16, right: 16 })
    .margin({ top: 24 })
  }
}