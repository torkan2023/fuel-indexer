# `forc index remove`

Stop and remove a running indexer.

```bash
forc index remove --url https://indexer.fuel.network
```

```text
USAGE:
    forc-index remove [OPTIONS]

OPTIONS:
        --auth <AUTH>            Authentication header value.
    -h, --help                   Print help information
    -m, --manifest <MANIFEST>    Path to the manifest of the indexer project being removed.
    -p, --path <PATH>            Path to the indexer project.
        --url <URL>              URL at which indexer is deployed. [default: http://localhost:29987]
    -v, --verbose                Enable verbose output.
```