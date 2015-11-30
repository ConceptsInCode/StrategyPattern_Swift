/*
 *
 * Protocols
 *
 */

// FlyBehavior defines a protocol for a flying strategy
protocol FlyBehavior: CustomStringConvertible {
    func fly() -> String
}

extension FlyBehavior {
    var description: String {
        get { return "I don't know about flying yet" }
    }
    
    func fly() -> String {
        return description
    }
}

// QuackBehavior defines a protocol for a quack strategy
protocol QuackBehavior: CustomStringConvertible {
    func quack() -> String
}

extension QuackBehavior {
    var description: String {
        get { return "I don't know about quacking yet" }
    }
    
    func quack() -> String {
        return description
    }
}

// Duck is the protocl for all ducks
// Swift doesnt support virtual classes, so we use a protocol instead
protocol Duck: CustomStringConvertible {
    var flyBehavior: FlyBehavior { get set }
    var quackBehavior: QuackBehavior { get set }
    
}

extension Duck {
    var description: String {
        get { return "I'm a duck of some sort" }
    }

    func performSwim() -> String {
        return "All ducks can swim"
    }
    
    init() { self.init() }
    
    init(flyBehavior: FlyBehavior, quackBehavior: QuackBehavior) {
        self.init()
        self.flyBehavior = flyBehavior
        self.quackBehavior = quackBehavior
    }
    
    func fly() -> String {
        return flyBehavior.fly()
    }
    
    func performQuack() -> String {
        return quackBehavior.quack()
    }
}

/*
 *
 * Implimentations
 *
 */

struct FlyWithWings: FlyBehavior {
    var description = "I can fly"
    func fly() -> String{
        return "I'm Flying!"
    }
}

struct CantFly: FlyBehavior {
    var description = "I can't fly because I'm not alive"
    func fly() -> String {
        return "I'm stuck in the water"
    }
}

struct Quack: QuackBehavior {
    var description = "I can quack"

    func quack() -> String {
        return "Quack Quack"
    }
}

struct MallardDuck: Duck {
    var description: String {
        get { return "I'm a Mallard duck: \(flyBehavior), \(quackBehavior)" }
    }

    var flyBehavior: FlyBehavior = FlyWithWings()
    var quackBehavior: QuackBehavior = Quack()
    
}

struct Decoy: Duck {
    var description: String {
        get { return "I'm a Mallard duck: \(flyBehavior), \(quackBehavior)" }
    }
    
    var flyBehavior: FlyBehavior = CantFly()
    var quackBehavior: QuackBehavior = Quack()
    
}

/*
 *
 * Instantiations
 *
 */

var mallard = MallardDuck()

mallard
mallard.fly()
mallard.performQuack()
mallard.performSwim()

var decoy = Decoy()
decoy.fly()
