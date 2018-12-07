package main

import (
  "io/ioutil"
  "fmt"
  "strings"
  "strconv"
  "sort"
)

func main() {
  data := getData()
  wrap := wrappingPaper(data)
  ribbon := ribbon(data)

  fmt.Println(wrap)
  fmt.Println(ribbon)
}

func getData() []string{
  // Opening our test data.
  content, err := ioutil.ReadFile("day_2_input.txt")
  //content, err := ioutil.ReadFile("example.txt")

  if err != nil {
    panic(err)
  }

  content_str := string(content)
  many_strings := strings.Split(content_str, "\n")
  return many_strings
}

func wrappingPaper(data []string) int {
  total_square_feet := 0

  for i := 0; i < len(data); i++ {
    lwh := strings.Split(data[i], "x")

    if len(lwh) > 1 {

      length, _ := strconv.Atoi(lwh[0])
      width, _ := strconv.Atoi(lwh[1])
      height, _ := strconv.Atoi(lwh[2])

      side_1 := length * width
      side_2 := width * height
      side_3 := height * length

      total_square_feet += ((2 * side_1) + (2 * side_2) + (2 * side_3))

      if side_1 <= side_2 && side_1 <= side_3 {
        total_square_feet += side_1
      } else if side_2 <= side_1 && side_2 <= side_3 {
        total_square_feet += side_2
      } else {
        total_square_feet += side_3
      }
    }
  }

  return total_square_feet
}

func ribbon(data []string) int {
  ribbon_amt := 0

  for i := 0; i < len(data); i++ {
    lwh := strings.Split(data[i], "x")

    if len(lwh) > 1 {

      length, _ := strconv.Atoi(lwh[0])
      width, _ := strconv.Atoi(lwh[1])
      height, _ := strconv.Atoi(lwh[2])

      sorted := []int{length, width, height}

      sort.Ints(sorted)

      ribbon_amt += (2 * sorted[0]) + (2 * sorted[1]) + (length * width * height)

    }
  }

  return ribbon_amt
}
