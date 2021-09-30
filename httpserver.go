package main

import (
	"log"
	"net/http"
)

func main() {
	http.Handle("/", http.FileServer(http.Dir("build/web/")))
	log.Fatal(http.ListenAndServe(":8888", nil))
}
