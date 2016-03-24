public protocol Responder {
    func respond(request: Request) throws -> Response
}

public typealias Respond = Request throws -> Response

public struct BasicResponder: Responder {
    let respond: Respond

    public init(_ respond: Respond) {
        self.respond = respond
    }

    public func respond(request: Request) throws -> Response {
        return try respond(request)
    }
}