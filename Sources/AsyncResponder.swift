public protocol AsyncResponder {
    func respond(request: Request, result: (Void throws -> Response) -> Void)
}

public typealias AsyncRespond = (request: Request, result: (Void throws -> Response) -> Void) -> Void

public struct BasicAsyncResponder: AsyncResponder {
    let respond: AsyncRespond

    public init(_ respond: AsyncRespond) {
        self.respond = respond
    }

    public func respond(request: Request, result: (Void throws -> Response) -> Void) {
        return respond(request, result: result)
    }
}
