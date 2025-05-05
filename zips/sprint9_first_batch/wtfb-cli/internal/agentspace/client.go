package agentspace
import "github.com/go-resty/resty/v2"
type Client struct{rest *resty.Client}
func NewClient(tok string)*Client{c:=resty.New().SetHeader("Authorization","Bearer "+tok).SetBaseURL("https://agentspace.googleapis.com/v1");return &Client{c}}
type AgentManifest struct{ Name,Description,Entrypoint string; Policies []string; Metadata map[string]string }
func (c *Client) RegisterAgent(m AgentManifest)(string,error){var resp struct{ID string `json:"id"`}
    _,err:=c.rest.R().SetBody(m).SetResult(&resp).Post("/agents");return resp.ID,err}
