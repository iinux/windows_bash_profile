package main

import (
	"flag"
	"syscall"
	"time"
	"unsafe"
)

const (
	MB_OK = 0x00000000
	MB_YESNOCANCEL = 0x00000003
)

func main() {
	// delay message box
	var mod = syscall.NewLazyDLL("user32.dll")
	var proc = mod.NewProc("MessageBoxW")
	var title = flag.String("t", "hello", "title")
	var content = flag.String("c", "world", "content")
	var second = flag.Int("s", 0, "second")
	var minute = flag.Int("m", 0, "minute")
	var hour = flag.Int("h", 0, "hour")

	flag.Parse()
	time.Sleep(time.Duration(*second)*time.Second+time.Duration(*minute)*time.Minute+time.Duration(*hour)*time.Hour)

	ret, _, _ := proc.Call(0,
		uintptr(unsafe.Pointer(syscall.StringToUTF16Ptr(*content))),
		uintptr(unsafe.Pointer(syscall.StringToUTF16Ptr(*title))),
		uintptr(MB_OK))
	_ = ret
}
