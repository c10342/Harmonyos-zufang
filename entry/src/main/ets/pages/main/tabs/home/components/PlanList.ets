import { HomePlanItem } from '../../../../../api';

@Component
export default struct PlanList {
  @Prop list: HomePlanItem[] = []

  build() {
    Row() {
      ForEach(this.list, (item: HomePlanItem) => {
        Image(item.imageURL)
          .width(78)
          .height(60)
      }, (item: HomePlanItem) => `${item.id}`)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({ left: 16, right: 16 })
    .margin({ top: 24 })
  }
}