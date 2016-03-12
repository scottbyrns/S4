public struct URI {
    public var scheme: String?
    public var userInfo: (username: String, password: String)?
    public var host: String?
    public var port: Int?
    public var path: String?
    public var query: [(key: String, value: String?)]
    public var fragment: String?
}