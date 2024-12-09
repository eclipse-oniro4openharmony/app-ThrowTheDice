import { Constants } from '../common/Constants'
import { Random } from '../common/Random'
import { DiceData } from '../model/DiceData';

@Entry
@Component

struct RollPage {
  @State winnerNumber: number = 0;
  @StorageProp("dice") currentDice: number = -1


  build() {
      Column() {
        Row() {
          Text("Your Dice Shown ")
            .fontSize($r('app.float.grid_title_font_size'))
            .height($r('app.float.grid_title_height'))
            .fontWeight(FontWeight.Bold)
            .margin({ top: $r('app.float.title_list_top_margin'), bottom: $r('app.float.title_list_top_margin') })

        }
        .width(Constants.FULL_PERCENT)
        .justifyContent(FlexAlign.Center)
        Row() {
          Text(this.winnerNumber.toString())
            .fontSize(50)
            .height('50%')
            .fontWeight(FontWeight.Bold)
            .margin({ top: $r('app.float.title_list_top_margin'), bottom: $r('app.float.title_list_top_margin') })


        }


        .width(Constants.FULL_PERCENT)
        .justifyContent(FlexAlign.Center)
        Column() {
          Button('Roll', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              console.log("DUPA: " + this.currentDice)
              if(this.currentDice != null)

                this.generateRandom()
            })

        }
        .height('100%')
        .width('100%')
        .padding('10vp')
      }
  }
  generateRandom() {
    if(this.currentDice != null)
    this.winnerNumber = Random.random(this.currentDice)
  }

  aboutToAppear(): void {
    this.generateRandom
  }





}
