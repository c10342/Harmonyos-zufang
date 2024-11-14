@Component
export default struct SearchBar {
  build() {
    Row() {
      Text('北京').fontColor($r('app.color.white')).fontSize(14)
      Row() {
        Image($r('app.media.search')).width(18).height(18)
        TextInput({ placeholder: '公司/地铁/小区，马上搜索' })
          .width('100%')
          .placeholderFont({ size: 10 })
          .placeholderColor($r('app.color.gray'))
          .layoutWeight(1)
          .padding({
            left: 10,
            top: 0,
            right: 10,
            bottom: 0
          })
          .height('100%')

        Image($r('app.media.position')).width(18).height(18)
      }
      .layoutWeight(1)
      .margin({ left: 16, right: 16 })
      .backgroundColor($r('app.color.white'))
      .borderRadius(19)
      .padding({ left: 16, right: 16 })

      Image($r('app.media.message')).width(24).height(24)
    }
    .height(38)
    .width('100%')
    .padding({ left: 16, right: 16 })
    .alignItems(VerticalAlign.Center)
    .margin({ top: 4 })
  }
}