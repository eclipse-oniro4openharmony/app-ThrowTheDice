@Component
export struct DiceItem {
  @State tapColor: Color = Color.Black;
  private diceImage: Resource = $r('app.media.app_icon');
  private diceName: string = "";
  private index: number = 0;



  build() {
    Column() {
      Image(this.diceImage)
        .width($r('app.float.grid_item_image_size'))
        .height($r('app.float.grid_item_image_size'))

      Text(this.diceName)
        .fontSize(16)
        .textAlign(TextAlign.Center)
    }
  }
}