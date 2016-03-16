public protocol HTTPRequestParser {
    func parse(data: Data) throws -> HTTPRequest?
}