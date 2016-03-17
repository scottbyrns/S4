public protocol Middleware {
    func respond(request: Request, chain: Responder) throws -> Response
}

extension Middleware {
    public func intercept(responder: Responder) -> Responder {
        return DefaultResponder { request in
            return try self.respond(request, chain: responder)
        }
    }
}

extension CollectionType where Self.Generator.Element == Middleware {
    public func intercept(responder: Responder) -> Responder {
        var responder = responder

        for middleware in self.reverse() {
            responder = middleware.intercept(responder)
        }

        return responder
    }
}