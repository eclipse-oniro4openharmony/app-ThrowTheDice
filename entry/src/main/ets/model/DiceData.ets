import { Dice } from './Dice';

export class DiceData {
  static readonly DICE_TYPE_LIST: Dice[] = [
    new Dice(2, $r('app.media.coin')),
    new Dice(4, $r('app.media.d4')),
    new Dice(6, $r('app.media.d6')),
    new Dice(8, $r('app.media.d8')),
    new Dice(10, $r('app.media.d10')),
    new Dice(12, $r('app.media.d12')),
    new Dice(20, $r('app.media.d20')),
    new Dice(100, $r('app.media.d100'))
  ];
}
