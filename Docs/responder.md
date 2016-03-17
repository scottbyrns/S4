# Responder

The `Responder` protocol represents a type that can respond to HTTP requests.

```swift
public protocol Responder {
    func respond(request: Request) throws -> Response
}
```

## Motivation

This is the most important protocol in an HTTP context. The responder is the base for higher-level abstractions like routers and middlewares.