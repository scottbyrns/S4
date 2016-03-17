public protocol Responder {
    func respond(request: Request) throws -> Response
}