import {Constants} from '../common/Constants';
@Component
export default struct GridItemComponent {
  itemName: string = '';
  itemImage: Resource = $r('app.media.app_icon');

  build() {

    GridItem() {
      Column() {
        Image(this.itemImage)
          .width($r('app.float.grid_item_image_size'))
          .height($r('app.float.grid_item_image_size'))
        Text(this.itemName)
          .fontSize($r('app.float.grid_item_name_font_size'))
          .textAlign(TextAlign.Center)
          .margin({ top: $r('app.float.grid_item_name_top_margin') })
          .height($r('app.float.grid_item_name_height'))
      }
      .height(Constants.FULL_PERCENT)
      .justifyContent(FlexAlign.Center)
    }
    .height($r('app.float.grid_item_height'))
  }
}