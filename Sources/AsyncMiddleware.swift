public protocol AsyncMiddleware {
    func respond(request: Request, chain: AsyncResponder, result: (Void throws -> Response) -> Void)
}

extension AsyncMiddleware {
    public func intercept(responder: AsyncResponder) -> AsyncResponder {
        return BasicAsyncResponder { request, result in
            self.respond(request, chain: responder, result: result)
        }
    }
}

#if swift(>=3.0)
extension Collection where Self.Iterator.Element == AsyncMiddleware {
    public func intercept(responder: AsyncResponder) -> AsyncResponder {
        var responder = responder

        for middleware in self.reversed() {
            responder = middleware.intercept(responder)
        }

        return responder
    }
}
#else
extension CollectionType where Self.Generator.Element == AsyncMiddleware {
    public func intercept(responder: AsyncResponder) -> AsyncResponder {
        var responder = responder

        for middleware in self.reverse() {
            responder = middleware.intercept(responder)
        }
        
        return responder
    }
}
#endif
