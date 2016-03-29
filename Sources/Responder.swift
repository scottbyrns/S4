public protocol Responder: AsyncResponder {
    func respond(request: Request) throws -> Response
}

extension Responder {
    public func respond(request: Request, result: (Void throws -> Response) -> Void) {
        result { try self.respond(request) }
    }
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