public typealias Port = Int

public protocol Server {
    func serve(responder: Responder, at port: Port) throws
}
