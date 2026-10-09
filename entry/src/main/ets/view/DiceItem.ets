@Component
export struct DiceItem {
  diceImage: Resource = $r('app.media.d6');
  sides: number = 6;

  build() {
    Column() {
      Image(this.diceImage)
        .width(this.sides === 100 ? 120 : 82)
        .height(82)
        .objectFit(this.sides === 100 ? ImageFit.Cover : ImageFit.Contain)
        .margin({ bottom: 12 })

      Text(this.sides === 2 ? $r('app.string.coin') : `D${this.sides}`)
        .fontSize(19)
        .fontWeight(FontWeight.Bold)
        .fontColor('#0F0026')

      Text(this.sides === 2 ? $r('app.string.coin_detail') :
        (this.sides === 100 ? $r('app.string.percentile_roll') :
          $r('app.string.die_sides', this.sides.toString())))
        .fontSize(13)
        .fontColor('#6024B5')
        .margin({ top: 4 })
    }
    .width('100%')
    .height(160)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#FFFFFF')
    .borderRadius(20)
    .border({ width: 1, color: '#E9DDF8' })
  }
}
