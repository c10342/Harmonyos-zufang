@Component
export default struct Ad {
  @Prop adPicture: string = '';

  build() {
    Image(this.adPicture)
      .width('100%%')
      .height(61)
      .objectFit(ImageFit.Fill)
      .margin({ top: 24 })
      .shadow({
        radius: 6,
        color: $r('app.color.shadow'),
        offsetX: 0,
        offsetY: 0
      })
  }
}