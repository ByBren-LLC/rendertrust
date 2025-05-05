resource "vault_mount" "kv2" {
  path = "wtfb-secrets"
  type = "kv-v2"
}
resource "vault_policy" "edge" {
  name="edge-read"
  policy=<<EOT
path "wtfb-secrets/data/edge/*" {
  capabilities = ["read"]
}
EOT
}
resource "vault_jwt_auth_backend_role" "edge-role" {
  backend = "jwt"
  role_name = "edge-node"
  bound_audiences = ["wtfb-edge"]
  user_claim = "sub"
  policies  = [vault_policy.edge.name]
}
