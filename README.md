# Swift X

[![Slack][slack-badge]][slack-url]

Cross project standards for Swift.

## Mission

It is Swift X's mission to create concise, clear, and well-documented standards to which all Swift projects can conform. By standarzing certain common functionalities, Swift X allows for radically improved cross-project compatibility for anything Swift. More compatibility means more collaboration which benefits each individual project as well as the Swift community as a whole.

Swift X strives to maintain the following core beliefs for all of its standards:
- Inclusive
    - Swift X standards should be unbiased and easy to adopt for all Swift projects.
- Community
    - Open Source and open to comments, criticisms, and pull requests.
- Performant
    - Conforming to Swift X standards should have the minimum possible impact on performance possible.
- Minimum viable requirements
    - Only the code that is absolutely necessary for cross-project compatibility will be included.
- Best practices
    - Swift X should abide by any widely accepted best practices in the Swift community, like naming conventions.

# S4 - Server Side Swift Standards

**S4** is Swift X's first package. Its goal is to create standards for server side frameworks.

This is what we have so far:

- [Byte](Docs/byte.md)
- [CustomDataStore](Docs/custom-data-store.md)
- [Data](Docs/data.md)
- [HTTPBody](Docs/http-body.md)
- [HTTPHeader](Docs/http-header.md)
- [HTTPHeaders](Docs/http-headers.md)
- [HTTPMessage](Docs/http-message.md)
- [HTTPMethod](Docs/http-method.md)
- [HTTPMiddleware](Docs/http-middleware.md)
- [HTTPRequest](Docs/http-request.md)
- [HTTPRequestConvertible](Docs/http-request-convertible.md)
- [HTTPRequestInitializable](Docs/http-request-initializable.md)
- [HTTPRequestParser](Docs/http-request-parser.md)
- [HTTPRequestRepresentable](Docs/http-request-representable.md)
- [HTTPRequestSerializer](Docs/http-request-serializer.md)
- [HTTPResponder](Docs/http-responder.md)
- [HTTPResponse](Docs/http-response.md)
- [HTTPResponseConvertible](Docs/http-response-convertible.md)
- [HTTPResponseInitializable](Docs/http-response-initializable.md)
- [HTTPResponseParser](Docs/http-response-parser.md)
- [HTTPResponseRepresentable](Docs/http-response-representable.md)
- [HTTPResponseSerializer](Docs/http-response-serializer.md)
- [HTTPStatus](Docs/http-status.md)
- [HTTPVersion](Docs/http-version.md)
- [Storage](Docs/storage.md)
- [Stream](Docs/stream.md)
- [URI](Docs/uri.md)

Keep in mind that **everything** is open for discussion. We have [pull requests](https://github.com/swift-x/s4/pulls) for each item. Every discussion related to an item should be done in its respective PR, even if it's already merged/closed. We **urge** you to participate on the discussions and contribute.

# Proposal

For a new proposal you should create a pull request containing the following:

- Pull request body description in the format defined in the [template](template.md).
- A markdown file in the format defined in the [template](template.md). The file should be located under the `Docs` directory and follow the naming convetion `example-file.md`.
- A swift file containing the code for the proposal located under the `Sources` directory.
- A link to the proposal markdown file in the `README.md` (this file), right below **This is what we have so far**. The items should be sorted alphabetically.

License
-------

**S4** is released under the MIT license. See LICENSE for details.

[slack-badge]: http://slack.swiftx.io/badge.svg
[slack-url]: http://slack.swiftx.io