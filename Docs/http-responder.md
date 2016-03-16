# HTTPResponder

The `HTTPResponder` protocol represents a type that can respond to HTTP requests.

```swift
public protocol HTTPResponder {
    func respond(request: HTTPRequest) throws -> HTTPResponse
}
```

## Motivation

This is the most important protocol in an HTTP context. The responder is the base for higher-level abstractions like routers and middlewares.