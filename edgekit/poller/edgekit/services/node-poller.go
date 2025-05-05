package main

import (
    "bytes"
    "encoding/csv"
    "encoding/json"
    "net/http"
    "os"
    "os/exec"
    "strconv"
    "time"
)

type Stats struct {
    VRAMMB int    `json:"vramMb"`
    TempC  int    `json:"tempC"`
    Driver string `json:"driver"`
}

func collect() Stats {
    out, _ := exec.Command("nvidia-smi",
        "--query-gpu=memory.total,temperature.gpu,driver_version",
        "--format=csv,noheader,nounits").Output()
    r := csv.NewReader(bytes.NewReader(out))
    rec, _ := r.Read()
    vram, _ := strconv.Atoi(rec[0])
    temp, _ := strconv.Atoi(rec[1])
    return Stats{VRAMMB: vram, TempC: temp, Driver: rec[2]}
}

func main() {
    gw := os.Getenv("FLEET_GATEWAY_URL")
    token := os.Getenv("EDGE_RELAY_TOKEN")
    for {
        stats := collect()
        buf, _ := json.Marshal(stats)
        req, _ := http.NewRequest("POST", gw+"/heartbeat", bytes.NewReader(buf))
        req.Header.Set("Authorization", "Bearer "+token)
        req.Header.Set("Content-Type", "application/json")
        http.DefaultClient.Do(req)
        time.Sleep(30 * time.Second)
    }
}
