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

    if xyx(data[i]) {
      marks += 1
    }

    if twoPairs(data[i]) {
      marks += 1
    }

    if marks == 2 {
      fmt.Println("Nice word.\n")
      valid_count += 1
    } else if data[i] == ""{
      fmt.Println("Skipping input.")
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


func xyx(word string) bool{
  letters := strings.Split(word, "")
  for i := 0; i < len(letters); i++ {
    if(i + 2) < len(letters) {
      if letters[i] == letters[i+2] {
        fmt.Println(letters[i] + letters[i+1] + letters[i+2])
        return true
      }
    }
  }
  return false
}

func twoPairs(word string) bool{
  letters := strings.Split(word, "")

  var pairs []string
  pairs = make([]string, 0, 0)

  for i := 0; i < len(letters); i++ {
    if i + 1 != len(letters) {
      a := letters[i] + letters[i+1]
      if a != " " {
        pairs = append(pairs, a)
      }
    }
  }

  for i := 0; i < len(pairs); i++ {
    pair_count := 0
    for j := 0; j < len(pairs) - i; j++ {
      if pairs[i] == pairs[j] {
        pair_count++
      }

      if pair_count > 1 {
        return true
      }
    }
  }


  fmt.Println(pairs)
  fmt.Println(len(pairs))
  return false
}
