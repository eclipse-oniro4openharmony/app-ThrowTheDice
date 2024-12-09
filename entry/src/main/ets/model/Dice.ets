export class Dice {


  public  name: string = "kosc";
  public  diceImage: Resource = $r('app.media.app_icon');
  public  index: number = 0;


  constructor(name: string, image: Resource, id: number) {
    this.name = name;
    this.diceImage = image;
    this.index = id;

  }
}