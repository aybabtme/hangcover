# hangcover

If a test file has the same package name as the package it tests, 
and if that test file imports the package it tests:

```go
// hangcover.go
package hangcover
```

```go
// hangcover_test.go
package hangcover

import "github.com/aybabtme/hangcover"
```

Then running `go test github.com/aybabtme/hangcover` will fail with an import cycle error:

```bash
# github.com/aybabtme/hangcover
./hang_test.go:4: import "github.com/aybabtme/hangcover" while compiling that package (import cycle)
FAIL	github.com/aybabtme/hangcover [build failed]
```

But running `go test -cover github.com/aybabtme/hangcover` will hang:

```bash
go test -cover github.com/aybabtme/hangcover
^C⏎
```

# to reproduce

Fetch this repository and run `./reproduce.sh`.

```bash
$ ./reproduce.sh
GOROOT=$(go env GOROOT)
go env GOROOT
GIT_DIR="$GOROOT/.git" git rev-parse --verify HEAD
886b02d705ffb1be8b4974ac4c355d480a24e3ec

go version
go version go1.4.1 darwin/amd64
go test -cover github.com/aybabtme/hangcover
^C⏎
```
