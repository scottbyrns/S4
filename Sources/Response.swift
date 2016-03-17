public struct Response: Message {
    public var version: Version
    public var status: Status
    public var headers: Headers
    public var body: Body
    public var storage: Storage
}