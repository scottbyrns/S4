# Middleware

The `Middleware` protocol represents a type that responds to an HTTP request optionally forwarding the request to the chain.


```swift
public protocol Middleware {
    func respond(request: Request, chain: Responder) throws -> Response
}
```

## Motivation

`Middleware` drastically reduces boilerplate and allows code reuse. This degisn allows middleware to be applied on the server and on the client, reducing boilerplate even further.