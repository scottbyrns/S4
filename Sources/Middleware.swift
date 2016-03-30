public protocol Middleware {
    func respond(request: Request, chain: Responder) throws -> Response
}

extension Middleware {
    public func intercept(responder: Responder) -> Responder {
        return BasicResponder { request in
            return try self.respond(request, chain: responder)
        }
    }
}

#if swift(>=3.0)
extension Collection where Self.Iterator.Element == Middleware {
    public func intercept(responder: Responder) -> Responder {
        var responder = responder

        for middleware in self.reversed() {
            responder = middleware.intercept(responder)
        }

        return responder
    }
}
#else
extension CollectionType where Self.Generator.Element == Middleware {
    public func intercept(responder: Responder) -> Responder {
        var responder = responder

        for middleware in self.reverse() {
            responder = middleware.intercept(responder)
        }

        return responder
    }
}
#endif
