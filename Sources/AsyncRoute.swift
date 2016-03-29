public protocol AsyncRoute: AsyncResponder {
    var path: String { get }
    var actions: [Method: AsyncResponder] { get }
    var fallback: AsyncResponder { get }
}

extension AsyncRoute {
    public var fallback: AsyncResponder {
        return BasicAsyncResponder { _, result in
            result {
                Response(status: .methodNotAllowed)
            }
        }
    }

    public func respond(request: Request, result: (Void throws -> Response) -> Void) {
        let action = actions[request.method] ?? fallback
        action.respond(request, result: result)
    }
}