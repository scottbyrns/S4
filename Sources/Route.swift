public protocol Route: Responder {
    var path: String { get }
    var actions: [Method: Responder] { get }
    var fallback: Responder { get }
}

extension Route {
    public var fallback: Responder {
        return BasicResponder { _ in
            Response(status: .methodNotAllowed)
        }
    }

    public func respond(request: Request) throws -> Response {
        let action = actions[request.method] ?? fallback
        return try action.respond(request)
    }
}