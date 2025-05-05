package cmd
import ("fmt";"os";"github.com/spf13/cobra";"github.com/wtfb/wtfb-cli/agentexport")
var rootCmd=&cobra.Command{Use:"wtfb",Short:"WTFB developer CLI"}
func Execute(){if err:=rootCmd.Execute();err!=nil{fmt.Println(err);os.Exit(1)}}
func init(){rootCmd.AddCommand(agentexport.ExportCmd)}
