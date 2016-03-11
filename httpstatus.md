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

Having `HTTPStatus` as an enum with a `Raw` case makes it convenient and flexible at the same time.
