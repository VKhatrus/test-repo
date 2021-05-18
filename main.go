package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
)

func RouteHandler(w http.ResponseWriter, r *http.Request) {
	msg := "PoNg"
	tmpl, err := template.ParseFiles("static/index.html")
	if err != nil {
		http.Error(w, err.Error(), 400)
		return
	}

	if err := tmpl.Execute(w, msg); err != nil {
		http.Error(w, err.Error(), 400)
		return
	}

}
func main() {
	http.HandleFunc("/ping", RouteHandler)
	fmt.Println("Server is listening...")
	err := http.ListenAndServe(":9000", nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}

}
