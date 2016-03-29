public protocol Router: Responder {
    var routes: [Route] { get }
    var fallback: Responder { get }
    func match(request: Request) -> Route?
}

extension Router {
    public func respond(request: Request) throws -> Response {
        let responder = match(request) ?? fallback
        return try responder.respond(request)
    }
}