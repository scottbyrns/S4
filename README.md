# S4 - Server Side Swift Standards

## Byte

The `Byte` type represents a byte.

```swift
public typealias Byte = UInt8
```

## Data

The `Data` type represents binary data as a collection of bytes.

> An alternative name could be `Buffer`.

```swift
public struct Data {
    public var bytes: [Byte]
}
```

## Stream

The `Stream` protocol represents a bi-directional stream of binary data.

```swift
public protocol Stream {
    var closed: Bool { get }
    func close() -> Bool
    func receive() throws -> Data
    func send(data: Data) throws
    func flush() throws
}
```

## StreamClient

The `StreamClient` protocol represents a type that can make a connection and return a stream of binary data.

```swift
public protocol StreamClient {
    func connect() throws -> Stream
}
```

## StreamServer

The `StreamServer` protocol represents a type that can accept a connection and return a stream of binary data.

```swift
public protocol StreamServer {
    func accept() throws -> Stream
}
```

## HTTPVersion

The `HTTPVersion` type represents an HTTP version.

```swift
public typealias HTTPVersion = (major: Int, minor: Int)
```

## HTTPHeader

The `HTTPHeader` type represents an HTTP header value.

```swift
public typealias HTTPHeader = (name: String, value: String)
```

## HTTPHeaders

The `HTTPHeaders` type represents HTTP headers.

```swift
public typealias HTTPHeaders = [HTTPHeader]
```

## HTTPBody

The `HTTPBody` type represents an HTTP body in buffer or stream form.

```swift
public enum HTTPBody {
    case BufferBody(Data)
    case StreamBody(Stream)
}
```

## Storage

The `Storage` type represents arbitrary data that can be passed between middleware and a responder in a chain.

```swift
public typealias Storage = [String: Any]
```

## HTTPMessage

The `HTTPMessage` protocol represents properties common to HTTP messages (request or response).

```swift
public protocol HTTPMessage {
    var version: HTTPVersion { get set }
    var headers: HTTPHeaders { get set }
    var body: HTTPBody { get set }
    var storage: Storage { get set }
}
```

## HTTPMethod

The `HTTPMethod` type represents an HTTP method.

```swift
public enum HTTPMethod {
    case Delete
    case Get
    case Head
    case Post
    case Put
    case Connect
    case Options
    case Trace
    case Copy
    case Lock
    case MkCol
    case Move
    case PropFind
    case PropPatch
    case Search
    case Unlock
    case Bind
    case Rebind
    case Unbind
    case ACL
    case Report
    case MkActicity
    case Checkout
    case Merge
    case MSearch
    case Notify
    case Subscribe
    case Unsubscribe
    case Patch
    case Purge
    case MkCalendar
    case Link
    case Unlink
    case Raw(method: String)
}
```

## URI

The `URI` type represents an URI.

```swift
public struct URI {
    public struct UserInfo {
        public var username: String
        public var password: String
    }

    public var scheme: String?
    public var userInfo: UserInfo?
    public var host: String?
    public var port: Int?
    public var path: String?
    public var query: [String: String]
    public var fragment: String?
}
```

## HTTPRequest

The `HTTPRequest` protocol represents an HTTP request.

```swift
public protocol HTTPRequest: HTTPMessage {
    var method: HTTPMethod { get }
    var uri: URI { get }
    var upgrade: ((response: HTTPResponse, stream: Stream) throws -> Void)? { get }
}
```

## HTTPRequestParser

The `HTTPRequestParser` protocol represents a type that can parse an HTTP request.

```swift
public protocol HTTPRequestParser {
    func parse(data: Data) throws -> HTTPRequest?
}
```

## HTTPRequestSerializer

The `HTTPRequestSerializer` protocol represents a type that can serialize HTTP requests.

```swift
public protocol HTTPRequestSerializer {
    func serialize(request: HTTPRequest, @noescape send: Data throws -> Void) throws
}
```

## HTTPStatus

The `HTTPStatus` protocol represents an HTTP status.

```swift
public enum HTTPStatus {
    case Continue
    case SwitchingProtocols
    case Processing

    case OK
    case Created
    case Accepted
    case NonAuthoritativeInformation
    case NoContent
    case ResetContent
    case PartialContent

    case MultipleChoices
    case MovedPermanently
    case Found
    case SeeOther
    case NotModified
    case UseProxy
    case SwitchProxy
    case TemporaryRedirect
    case PermanentRedirect

    case BadRequest
    case Unauthorized
    case PaymentRequired
    case Forbidden
    case NotFound
    case MethodNotAllowed
    case NotAcceptable
    case ProxyAuthenticationRequired
    case RequestTimeout
    case Conflict
    case Gone
    case LengthRequired
    case PreconditionFailed
    case RequestEntityTooLarge
    case RequestURITooLong
    case UnsupportedMediaType
    case RequestedRangeNotSatisfiable
    case ExpectationFailed
    case ImATeapot
    case AuthenticationTimeout
    case EnhanceYourCalm
    case UnprocessableEntity
    case Locked
    case FailedDependency
    case PreconditionRequired
    case TooManyRequests
    case RequestHeaderFieldsTooLarge

    case InternalServerError
    case NotImplemented
    case BadGateway
    case ServiceUnavailable
    case GatewayTimeout
    case HTTPVersionNotSupported
    case VariantAlsoNegotiates
    case InsufficientStorage
    case LoopDetected
    case NotExtended
    case NetworkAuthenticationRequired

    case Raw(statusCode: Int, reasonPhrase: String)
}
```

## HTTPResponse

The `HTTPResponse` protocol represents an HTTP response.

```swift
public protocol HTTPResponse: HTTPMessage {
    var status: HTTPStatus { get }
    var upgrade: ((request: HTTPRequest, stream: Stream) throws -> Void)? { get }
}
```

## HTTPResponseParser

The `HTTPResponseParser` protocol represents a type that can parse an HTTP response.

```swift
public protocol HTTPResponseParser {
    func parse(data: Data) throws -> HTTPResponse?
}
```

## HTTPResponseSerializer

The `HTTPResponseSerializer` protocol represents a type that can serialize HTTP responses.

```swift
public protocol HTTPResponseSerializer {
    func serialize(response: HTTPResponse, @noescape send: Data throws -> Void) throws
}
```

## HTTPResponder

The `HTTPResponder` protocol represents a type that can respond to HTTP requests.

```swift
public protocol HTTPResponder {
    func respond(request: HTTPRequest) throws -> HTTPResponse
}
```

## HTTPMiddleware

The `HTTPMiddleware` protocol represents a type that responds to an HTTP request optionally forwarding the request to the chain.


```swift
public protocol HTTPMiddleware {
    func respond(request: HTTPRequest, chain: HTTPResponder) throws -> HTTPResponse
}
```

## HTTPServer

The `HTTPServer` protocol represents a type that serves HTTP requests by:

- Accepting a connection
- Parsing the HTTP request
- Responding the HTTP request
- Serializing the HTTP response

```swift
public protocol HTTPServer {
    var server: StreamServer { get }
    var parser: HTTPRequestParser { get }
    var responder: HTTPResponder { get }
    var serializer: HTTPResponseSerializer  { get }
}
```

## HTTPClient

The `HTTPClient` protocol represents a type that sends HTTP requests by:

- Making a connection
- Serializing the HTTP request
- Parsing the HTTP response

```swift
public protocol HTTPClient: HTTPResponder {
    var client: StreamClient { get }
    var serializer: HTTPRequestSerializer { get }
    var parser: HTTPResponseParser { get }
}
```

## HTTPRoute

The `HTTPRoute` protocol represents an HTTP route.

```swift
public protocol HTTPRoute: HTTPResponder {
    var path: String { get }
    var actions: [HTTPMethod: HTTPResponder] { get }
    var fallback: HTTPResponder { get }
}
```

## HTTPRouter

The `HTTPRouter` protocol represents an HTTP router.

```swift
public protocol HTTPRouter: HTTPResponder {
    var routes: [HTTPRoute] { get }
    var fallback: HTTPResponder { get }
}
```