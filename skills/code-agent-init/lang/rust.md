# Rust Instructions

## Error Handling

- Use `thiserror` for library, domain, and module-level error types that callers may inspect or match.
- Use `anyhow` for application entry points, CLI commands, task orchestration, tests, and other top-level flows where rich context matters more than exposing a stable error type.
- Add context when converting or propagating fallible operations with `anyhow::Context`, especially around filesystem, network, process, parsing, and configuration boundaries.
- Prefer explicit typed errors with `thiserror` when an error is part of a public API, crosses crate boundaries, needs structured recovery, or should remain stable for downstream callers.
- Avoid stringly typed errors for recoverable cases; model them as enum variants with meaningful fields.
- Do not use `anyhow::Error` in public library APIs unless the crate is explicitly application-only.
