public protocol RequestParser {
    func parse(data: Data) throws -> Request?
}