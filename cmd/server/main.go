package main

import (
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	router := mux.NewRouter()

	router.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "Hello world! This is v0.0.2.")
	})

	http.Handle("/", router)
	http.ListenAndServe(":8080", nil)
}
