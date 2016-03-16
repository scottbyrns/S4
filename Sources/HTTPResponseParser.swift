public protocol HTTPResponseParser {
    func parse(data: Data) throws -> HTTPResponse?
}