public protocol AsyncRouter: AsyncResponder {
    var routes: [AsyncRoute] { get }
    var fallback: AsyncResponder { get }
    func match(request: Request) -> AsyncRoute?
}

extension AsyncRouter {
    public func respond(request: Request, result: (Void throws -> Response) -> Void) {
        let responder = match(request) ?? fallback
        responder.respond(request, result: result)
    }
}
