public struct Response: Message {
    public var version: Version
    public var status: Status
    public var headers: Headers
    public var body: Body
    public var storage: Storage = [:]

    public init(version: Version, status: Status, headers: Headers, body: Body) {
        self.version = version
        self.status = status
        self.headers = headers
        self.body = body
    }
}

extension Response {
    public init(status: Status = .ok, headers: Headers = [:], body: Stream) {
        self.init(
            version: Version(major: 1, minor: 1),
            status: status,
            headers: headers,
            body: .stream(body)
        )

        self.headers["Transfer-Encoding"] = "chunked"
    }

    public init(status: Status = .ok, headers: Headers = [:], body: Data = nil) {
        self.init(
            version: Version(major: 1, minor: 1),
            status: status,
            headers: headers,
            body: .buffer(body)
        )

        self.headers["Content-Length"] = HeaderValues(body.count.description)
    }
}