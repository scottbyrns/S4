## HTTPStatus

The `HTTPStatus` protocol represents an HTTP status.

```swift
public enum HTTPStatus {
    case OK
    case Created
    case Accepted
    ...
}
```

### Motivation

Having `HTTPStatus` as an enum with a `Raw` case ensures flexible and accurate communication of HTTP status between projects. Without an enum, string matching issues could cause inconsistencies.