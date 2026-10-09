import { Random } from '../common/Random';

@Entry
@Component
struct RollPage {
  @State winnerNumber: number = 0;
  @StorageProp('dice') currentDice: number = 0;

  aboutToAppear(): void {
    this.generateRandom();
  }

  private generateRandom(): void {
    if (this.currentDice > 0) {
      this.winnerNumber = Random.random(this.currentDice);
    }
  }

  build() {
    Column() {
      Button($r('app.string.back'))
        .fontSize(16)
        .fontColor('#6024B5')
        .backgroundColor('#FFFFFF')
        .borderRadius(12)
        .height(44)
        .alignSelf(ItemAlign.Start)
        .onClick(() => this.getUIContext().getRouter().back())

      Text(this.currentDice === 2 ? $r('app.string.coin') : `D${this.currentDice}`)
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .fontColor('#0F0026')
        .width('100%')
        .margin({ top: 28 })

      Blank()
        .layoutWeight(1)

      Column() {
        Text($r('app.string.result'))
          .fontSize(16)
          .fontColor('#6024B5')
          .margin({ bottom: 18 })

        Text(this.currentDice === 2 ?
          (this.winnerNumber === 1 ? $r('app.string.heads') : $r('app.string.tails')) :
          this.winnerNumber.toString())
          .fontSize(this.currentDice === 2 ? 56 : 88)
          .fontWeight(FontWeight.Bold)
          .fontColor('#0F0026')
          .maxLines(1)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .height(260)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
      .borderRadius(28)
      .border({ width: 1, color: '#E9DDF8' })

      Blank()
        .layoutWeight(1)

      Button($r('app.string.roll_again'))
        .width('100%')
        .height(56)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FFFFFF')
        .backgroundColor('#6024B5')
        .borderRadius(16)
        .onClick(() => this.generateRandom())
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 24, bottom: 24 })
    .backgroundColor('#F8F3FF')
  }
}
