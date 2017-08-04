package main

import (
	"IotGo/lib/utils"
	"net"
	"runtime"
	"time"
	"fmt"
)

func OneClient() {
	conn, err := net.Dial("tcp", "127.0.0.1:3333")
	if err != nil {
		return
	}
	defer conn.Close()
	fmt.Println("client connected successful")
}

func runOneClient() {
	for {
		//time.Sleep(time.Duration(20 * time.Second))
		OneClient()
	}
}

func main() {
	runtime.GOMAXPROCS(runtime.NumCPU())
	var i uint32
	for i = 0; i <= 100; i++ {
		time.Sleep(time.Duration(3 * time.Second))
		go runOneClient()
	}

	for {
		utils.CorrectSleepOneSecond()
		fmt.Println("finished......")
	}
}
