export class Random {
  static random(sides: number): number {
    if (sides === 2) {
      return Math.floor(Math.random() * 2);
    }
    return Math.floor(Math.random() * sides) + 1;
  }
}
