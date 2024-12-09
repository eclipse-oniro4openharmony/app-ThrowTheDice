import { Dice } from "./Dice";

export class DiceData {
  static storageName: string = "dice"
  static diceTypeList: Dice[] = [
  new Dice("Coin", $r('app.media.coin') ,2 ),
  new Dice("K4", $r('app.media.d4'), 4),
  new Dice("K6", $r('app.media.d6'), 6),
  new Dice("K8", $r('app.media.d8'), 8),
  new Dice("K10", $r('app.media.d10'), 10),
  new Dice("K12", $r('app.media.d12'), 12),
  new Dice("K20", $r('app.media.d20'), 20),
  new Dice("K100", $r('app.media.d10'), 100)];


}