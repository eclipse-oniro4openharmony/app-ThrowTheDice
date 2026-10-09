export class Dice {
  readonly sides: number;
  readonly diceImage: Resource;

  constructor(sides: number, diceImage: Resource) {
    this.sides = sides;
    this.diceImage = diceImage;
  }
}
