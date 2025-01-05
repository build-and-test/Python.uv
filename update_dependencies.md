# Python

Edit `.python_version`.

# Python modules

Automatically updated by dependabot. Or manually, run `build-and-test` once to bootstrap UV and then:

```bash
# Consider --allow-unsafe and --generate-hashes
.uv/bin/uv pip compile --upgrade --universal --strip-extras --quiet --output-file=requirements.txt requirements.in
.uv/bin/uv pip compile --upgrade --universal --strip-extras --quiet --output-file=requirements.dev.txt requirements.dev.in
```

# UV

Edit build-and-test scripts: set `UV_VERSION`.

# GitHub Actions

Automatically updated by dependabot.
