# Load go
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/go/bin:$PATH"
fi

if [ -d "$(go env GOPATH)/bin" ] ; then
    PATH="$(go env GOPATH)/bin:$PATH"
fi
