import { DiceData } from '../model/DiceData';
import { Dice } from '../model/Dice';
import { DiceItem } from '../view/DiceItem';

@Entry
@Component
struct Index {
  @StorageLink('dice') currentDice: number = 0;

  build() {
    Column() {
      Text($r('app.string.choose_die'))
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .fontColor('#0F0026')
        .width('100%')
        .margin({ bottom: 24 })

      Grid() {
        ForEach(DiceData.DICE_TYPE_LIST, (item: Dice) => {
          GridItem() {
            DiceItem({
              diceImage: item.diceImage,
              sides: item.sides
            })
          }
          .onClick(() => {
            this.currentDice = item.sides;
            this.getUIContext().getRouter().pushUrl({ url: 'pages/RollPage' });
          })
        }, (item: Dice) => item.sides.toString())
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(12)
      .rowsGap(12)
      .scrollBar(BarState.Off)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 32, bottom: 16 })
    .backgroundColor('#F8F3FF')
  }
}
