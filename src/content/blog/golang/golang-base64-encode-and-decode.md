---
author: WeiChou
pubDatetime: 2023-08-11T00:00:00Z
modDatetime: 2023-08-11T00:00:00Z
title: Golang | Base64 Encode and Decode
slug: golang-base64-encode-and-decode
featured: false
draft: false
tags:
  - Golang
description:
  Examples for base64 string encode and decode.
---

Runnable examples for base64 string encode and decode:

- [The Go Playground](https://play.golang.org/p/6ewr4ulz0ra)
- [The Go Playground](https://play.golang.org/p/UWpQmE6pJSm)

## Table of contents

## Base64 String Encode
Encode the string to base64 format:
```
package main

import (
	"encoding/base64"
	"fmt"
	"bytes"
	"encoding/binary"
	"math"
)

func main() {
	val := 0.123
	valToBytes := Float64ToByte(val)
	fmt.Println("Convert float", val, "to byte array:", valToBytes)
	
	base64EncodedStr := base64.StdEncoding.EncodeToString(valToBytes)
	fmt.Println("Encoded byte array to base64 string: ",base64EncodedStr)
	
	decodedToBytes, _ := base64.StdEncoding.DecodeString(base64EncodedStr)
	
	fmt.Println("Decode base64 string to float      :",Float64frombytes(decodedToBytes))
}

func Float64ToByte(f float64) []byte {
    var buf bytes.Buffer
    err := binary.Write(&buf, binary.BigEndian, f)
    if err != nil {
        fmt.Println("binary.Write failed:", err)
    }
    return buf.Bytes()
}

func Float64frombytes(bytes []byte) float64 {
    bits := binary.BigEndian.Uint64(bytes)
    float := math.Float64frombits(bits)
    return float
}
```

## Base64 String Decode
Decode the string from base64 format:
```
package main

import (
	"encoding/base64"
	"fmt"
	"encoding/binary"
	"math"
)

func main() {
	str := "QFvOSowVTJg="
	bytes1, _ := base64.StdEncoding.DecodeString(str)
	str2 := "QFvOFHrhR60="
	bytes2, _ := base64.StdEncoding.DecodeString(str2)
	
    fmt.Println(Float64frombytes(bytes1))
	fmt.Println(Float64frombytes(bytes2))
}

func Float64frombytes(bytes []byte) float64 {
    bits := binary.BigEndian.Uint64(bytes)
    float := math.Float64frombits(bits)
    return float
}
```
