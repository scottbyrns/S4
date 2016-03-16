public protocol HTTPMessage: CustomDataStore {
    var version: HTTPVersion { get set }
    var headers: HTTPHeaders { get set }
    var body: HTTPBody { get set }
}