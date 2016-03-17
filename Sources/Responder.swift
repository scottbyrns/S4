public protocol Responder {
    func respond(request: Request) throws -> Response
}

typealias Respond = Request throws -> Response

struct DefaultResponder: Responder {
    let respond: Respond

    init(_ respond: Respond) {
        self.respond = respond
    }

    func respond(request: Request) throws -> Response {
        return try respond(request)
    }
}