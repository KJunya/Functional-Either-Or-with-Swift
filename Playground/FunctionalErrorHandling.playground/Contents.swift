let f: (Int) -> Int = {x in x + 10}

let a: Int? = nil
let b = a.flatMap(f)
print(b as Any)

let v = [1,2,nil,4]
//let w = v.compactMap(f) // error
let w = v.compactMap({y in y.flatMap(f)})
print(w)

enum Either<L, R> {
    case Left(L)
    case Right(R)
    
    func fold<T>(_ value: T, do f: (R) -> T) -> T {
        return either({_ in value}, or: f)
    }
    
    func flatMap<T>(_ f: (R) -> T) -> T {
        switch self {
        case .Left(let l):
            return Either<L, R>.Left(l) as! T
        case .Right(let r):
            return f(r)
        }
    }
    
    func either<T>(_ onLeft: (L) -> T, or onRight: (R) -> T) -> T {
        switch self {
        case .Left(let l):
            return onLeft(l)
        case .Right(let r):
            return onRight(r)
        }
    }
}

let p: Either<String, Int> = .Right(5)
let q: Either<String, Int> = .Left("Derp")
let g: (String) -> Int = {s in s.count}
print(p.either(g, or: f))
print(q.either(g, or: f))

