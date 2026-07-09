package main

import (
	"fmt"
	"os"
	"github.com/tredoe/crypt/sha512_crypt"
)

func main() {

	if len(os.Args) < 2 {
		fmt.Println("Usage: mkpasswd-go <password>")
		os.Exit(1)
	}

	c := sha512_crypt.New()
	hash, err := c.Generate([]byte(os.Args[1]), nil) // nil = random salt
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error: %v\n", err)
		os.Exit(1)
	}
	fmt.Println(string(hash))
}

