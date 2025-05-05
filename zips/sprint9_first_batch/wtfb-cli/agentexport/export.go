package agentexport
import ("encoding/json";"fmt";"io/ioutil";"os";"github.com/spf13/cobra";"github.com/wtfb/wtfb-cli/internal/agentspace")
type AgentManifest struct{ Name string `json:"name"`;Description string `json:"description"`;Entrypoint string `json:"entrypoint"`;Policies []string `json:"policies"`;Metadata map[string]string `json:"metadata"`}
var ExportCmd=&cobra.Command{Use:"export [manifest]",Short:"Export agent",Args:cobra.ExactArgs(1),
RunE:func(cmd *cobra.Command,args []string)error{data,err:=ioutil.ReadFile(args[0]);if err!=nil{return err}
    var m AgentManifest;if err:=json.Unmarshal(data,&m);err!=nil{return err}
    tok:=os.Getenv("AGENTSPACE_TOKEN");if tok==""{return fmt.Errorf("AGENTSPACE_TOKEN not set")}
    id,err:=agentspace.NewClient(tok).RegisterAgent(m);if err!=nil{return err}
    fmt.Printf("Agent registered with ID %s\n",id);return nil}}
