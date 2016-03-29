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

extension Collection where Self.Iterator.Element == AsyncMiddleware {
    public func intercept(responder: AsyncResponder) -> AsyncResponder {
        var responder = responder

        for middleware in self.reversed() {
            responder = middleware.intercept(responder)
        }

        return responder
    }
}