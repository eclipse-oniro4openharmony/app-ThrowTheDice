
export class Random {

  static random(edge: number): number {
		let result = 0
		console.log("DUPA:" + edge.toString() )
		if(edge!= 2) {

			result = Math.floor(Math.random() * edge) +1;
		} else {
			let test = Math.random()
			console.log("AAA@   " + test.toString())
			if(test > 0.5) {

				result = 1 ;
			} else {
				result = 0 ;

			}

		}

		return result;
	}
}