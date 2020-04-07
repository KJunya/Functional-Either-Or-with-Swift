//
//  Either.swift
//  FunctionalEitherOr
//
//  Created by Junya Komatsu on 2020/04/07.
//

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
