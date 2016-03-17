public protocol Middleware {
    func respond(request: Request, chain: Responder) throws -> Response
}