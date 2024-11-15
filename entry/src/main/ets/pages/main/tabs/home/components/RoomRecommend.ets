import { getNearbyHouses, HouseItem } from '../../../../../api';
import { CommonDataSource } from '../../../../../utils/BaseDataSource';

interface Tag {
  "name": string
}


@Component
export default struct RoomRecommend {
  private data: CommonDataSource<HouseItem> = new CommonDataSource();

  async aboutToAppear() {
    const res = await getNearbyHouses()
    this.data.pushData(...res.data)
  }

  @Builder
  buildNav() {
    Row() {
      Text() {
        Span('周边房源')
        Span('推荐').fontColor($r('app.color.primary'))
      }.fontSize(18)

      Row({ space: 6 }) {
        Text('更多推荐').fontColor($r('app.color.gray_second')).fontSize(12)
        Image($r('app.media.arrow_right')).width(4).height(8)
      }
    }
    .width('100%')
    .height(67)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor($r('app.color.white'))
    .padding({ left: 16, right: 16 })
  }

  @Builder
  buildItem(item: HouseItem) {
    Column() {
      Stack() {
        Image(item.housePicture)
          .width('100%').height(120)
        Image($r('app.media.room_text_bg')).width('100%').height(120)
        Row({ space: 4 }) {
          Image($r('app.media.location')).width(12).height(14)
          Text(item.address)
            .fontSize(10)
            .fontColor($r('app.color.white'))
        }
        .position({ bottom: 8, left: 8 })
        .alignItems(VerticalAlign.Center)
      }.width('100%')

      Column({ space: 10 }) {
        Row() {
          Text() {
            Span(item.rentPriceListing).fontSize($r('app.integer.fs_12'))
            Span(item.rentPriceUnit).fontSize($r('app.integer.fs_12'))
          }.fontColor('#E03810')

          Text(`${item.rentArea}m`)
            .fontSize(10)
            .fontColor('#999999')
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Text(item.houseTitle)
          .width('100%')
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontSize(12)
          .fontColor($r('app.color.black'))
        Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
          ForEach(item.tags.slice(0, 2), (tag: Tag) => {
            Text(tag.name)
              .backgroundColor('#36D1A1')
              .borderRadius(2)
              .fontSize(10)
              .fontColor($r('app.color.white'))
              .lineHeight(15)
              .padding({ left: 6, right: 6 })
              .margin({ right: 10, bottom: 10 })
          })
        }.width('100%')
      }.width('100%')
      .padding({ left: 10, top: 10, right: 10 })
      .alignItems(HorizontalAlign.Start)
    }.width('100%')
    .alignItems(HorizontalAlign.Start)
    .borderRadius(8)
    .backgroundColor($r('app.color.white'))
  }

  build() {
    Column() {
      this.buildNav()
      Grid() {
        LazyForEach(this.data, (item: HouseItem) => {
          GridItem() {
            this.buildItem(item)
          }
        }, (item: HouseItem) => `${item.id}`)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(8)
      .rowsGap(8)
      .width('100%')
      .backgroundColor($r('app.color.bg_gray'))
      .padding({ left: 16, right: 16, top: 16 })

    }
    .margin({ top: 24 })
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}