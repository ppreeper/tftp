all: clean build win64

clean:
	go clean -i

test:
	go test -cover -race -v ./...

build: clean
	go build cmd/tftp/tftp.go
	go build cmd/tftpd/tftpd.go

win64: clean
	env GOOS=windows GOARCH=amd64 go build -a -o tftp.exe cmd/tftp/tftp.go
	env GOOS=windows GOARCH=amd64 go build -a -o tftpd.exe cmd/tftpd/tftpd.go
