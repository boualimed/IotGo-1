package main

import (
	"net"
	"net/http"
	_ "net/http/pprof"
	"runtime"
	"IotGo/lib/utils"
	"fmt"
)

func main() {
	//建立socket，监听端口
	runtime.GOMAXPROCS(runtime.NumCPU())
	//fmt.Println(debug.SetGCPercent(-1) )

	go func() {
		http.ListenAndServe("0.0.0.0:6060", nil)
	}()

	//go utils.GC(5)
	netListen, err := net.Listen("tcp", "0.0.0.0:3333")
	utils.CheckErr(err)
	defer netListen.Close()

	fmt.Println("server restarted")

	for {
		conn, err := netListen.Accept()
		if err != nil {
			continue
		}

		go handleConnection(&conn)
	}
}

//处理连接
func handleConnection(conn *net.Conn) {
	defer (*conn).Close()

	fmt.Println("client is connected")
}

