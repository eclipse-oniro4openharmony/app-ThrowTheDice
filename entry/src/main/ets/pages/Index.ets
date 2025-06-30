import { Constants } from '../common/Constants';
import { DiceData } from '../model/DiceData';
import GridComponent from '../view/GridComponent';
import GridItemComponent from '../view/GridItemComponent';
/*import { router } from '@kit.ArkUI';*/
import { DiceItem } from '../view/DiceItem';
import { Dice } from '../model/Dice';

@Entry
@Component
struct Index {
  @State message: string = 'Choose dice';
  itemImage: Resource = $r('app.media.app_icon');
  idIndex: number = 0;
  @StorageLink("dice") currentDice: number = 0

  build() {
    Column() {
      Row() {
        Text("Choose Your Dice!!")
          .fontSize($r('app.float.grid_title_font_size'))
          .height($r('app.float.grid_title_height'))
          .fontWeight(FontWeight.Bold)
          .margin({ top: $r('app.float.title_list_top_margin'), bottom: $r('app.float.title_list_top_margin') })

      }
      .width(Constants.FULL_PERCENT)
      .justifyContent(FlexAlign.Center)


      Grid() {
        ForEach(DiceData.diceTypeList, (item: Dice) => {
          GridItem() {
            DiceItem({
              diceName: item.name,
              diceImage: item.diceImage,
              index: item.index


            })
          }

          .onClick(() => {
            console.log("AAAAA")
            this.currentDice = item.index
            this.getUIContext().getRouter().pushUrl({
              url: 'pages/RollPage'
            })
          })
          .width('30%')
        })
      }
      .height('70%')

      Column() {
        Button('Roll', { type: ButtonType.Normal, stateEffect: true })
          .onClick(() => {
            console.log("AAAAA")
          })

      }
      .height('100%')
      .width('100%')
      .padding('10vp')

    }
  }
}



