// @Observed
import { MLog } from '../utils/log/MLog'

export class HomeViewModel {
  index: number = 0
  nums: Array<number> = new Array(1)
  me: Person = new Person("", 0, new Person("", 0))

  getIndex(): number {
    return this.index++
  }

  getNums(ddd: number[]): string {
    // return "" + this.index++
    // this.nums.push(1,2,3,4)
    // this.nums.push(this.getIndex())
    this.nums = this.nums.concat(ddd)
    return "" + this.nums.toString() + " -> " + this.index
  }

  getPerson(): string {
    // this.me = new Person("小李", 10)

    // old.name = "小王"
    // old.age = 19

    this.me.name = "小张"
    this.me.age = 25
    //
    // this.me.gf!.name = "小陈"
    // this.me.gf!.age++

    MLog.debug("name:" + this.me.name + " age:" + this.me.age)
    return "name:" + this.me.name + " age:" + this.me.age
  }
}

@Observed
export class Person {
  name: string
  age: number
  gf: Person | undefined

  constructor(name: string, age: number, gf?: Person) {
    this.name = name
    this.age = age
    this.gf = gf
  }
}

@Observed
export class ObservedArray<T> extends Array<T> {
  constructor(args?: T[]) {
    if (args instanceof Array) {
      super(...args);
    } else {
      super();
    }
  }
}
