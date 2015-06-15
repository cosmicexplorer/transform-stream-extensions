transform-stream-extensions
===========================

Basic extensions to the Transform stream class.

# WHAT

1. Checks whether 'new' was called, and if not, pretends it was (i.e. can call as regular function).
2. Propagates errors from whatever stream is piped to it; if a stream piped to it raises an error, it will emit the same error. This allows you to centralize error-handling into a single place (the end of your transform stream chain).
3. Adds an `src` attribute to the stream; whenever another stream is piped to it, you can access that stream with `@src` (or `this.src` in javascript).

If 2 and 3 are not desired, you can turn them off by setting the attribute `dontPropagateErrors` to something not null or undefined in the (optional) options object provided to the constructor.

# HOW

Check out [the test code](test.coffee).

# LICENSE

GPL v3
