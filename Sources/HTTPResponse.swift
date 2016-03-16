public struct HTTPResponse: HTTPMessage {
    public var version: HTTPVersion
    public var status: HTTPStatus
    public var headers: HTTPHeaders
    public var body: HTTPBody
    public var storage: Storage
}