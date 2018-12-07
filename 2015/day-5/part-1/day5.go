package main

import (
  "io/ioutil"
  "fmt"
  "strings"
  "strconv"
)

func main() {
  data := getData()
  valid_count := 0
  for i := 0; i < len(data); i++ {
    marks := 0

    if checkForVowels(data[i]) {
      marks += 1
      //fmt.Println("Vowels ok.")
    }

    if checkForDuplicates(data[i]) {
      marks += 1
      //fmt.Println("Duplicates ok.")
    }

    if checkForBannedStrings(data[i]) == false {
      marks += 1
      //fmt.Println("No banned strings.")
    }

    if marks > 2 {
      valid_count += 1
      fmt.Println("Valid word.\n")
    } else {
      fmt.Println("Naughty word.\n")
    }
  }

  fmt.Println("There are " + strconv.Itoa(valid_count) + " nice words.")
}

func getData() []string{
  // Opening our test data.
  content, err := ioutil.ReadFile("day_5_input.txt")
  //content, err := ioutil.ReadFile("example.txt")

  if err != nil {
    panic(err)
  }

  content_str := string(content)
  many_strings := strings.Split(content_str, "\n")
  return many_strings
}


func checkForVowels(word string) bool{
  letters := strings.Split(word, "")
  count := 0
  for i := 0; i < len(letters); i++ {

    switch {
      case letters[i] == "a":
        count += 1
      case letters[i] == "e":
        count += 1
      case letters[i] == "i":
        count += 1
      case letters[i] == "o":
        count += 1
      case letters[i] == "u":
        count += 1
    }
  }

  if count > 2 {
    //fmt.Println("Count: " + strconv.Itoa(count))
    return true
  } else {
    return false
  }
}

func checkForDuplicates(word string) bool{
  letters := strings.Split(word, "")
  for i := 0; i < len(letters); i++ {
    if (i + 1) < len(letters) {
      if letters[i] == letters[i+1] {
        return true
      }
    }
  }
  return false
}

func checkForBannedStrings(word string) bool {

  // ab, cd, pq, or xy
  switch {
    case strings.Contains(word, "ab"):
      return true
    case strings.Contains(word, "cd"):
      return true
    case strings.Contains(word, "pq"):
      return true
    case strings.Contains(word, "xy"):
      return true
  }
  return false
}
