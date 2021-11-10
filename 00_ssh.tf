resource "aws_key_pair" "yslee_key" {
  key_name = "yslee2_key"
 # public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQChfglKwWEzqY8+dn/t6RDgprFzFojpV91hfdbVXC3qs1dLoCBAZlzE+rxn0mtpPliMyAz3PKgdKV/xVa1Noqa9/WmQX4PVv3EtWL6X91nnYsmLiwP05DjkofYfBviRvuvClY1hTtFnKUBMGqIkmvDw0IAsaXsDCwqwa/W3TFeJZ7OLk5Tbn2vwlW4z9Y9WVzmVwnikyTOzvPIjrErYXRSojII/95SX4zPUMePVJxzhfJJ8BTK4V7kKVQhpjjE/8p1gzn4CRtKusR1f9bcnorxceN0EYuNaDx1loMP1y60l5FxgIZkHCZgAL+K5TYgEIlk05YlspNqm2+QnKkwIF0XwC3W+Uh2x2GhJ+MEDm8+40Dfmys7lQjFjYONpyXuGu7Di/c1B0D0AypIn4dvkpRlRCLeadIJWwew+ZnUEs9eYn9Bi/BCED/EcS4ImNzQPv++V9dUSFX0cFRnlFyxLFZP4iTiJhKOBYpiaxh0Mymbv+N1L3EodbE0zUR5hA+8n+zc="
  public_key = file("../../.ssh/yslee-key.pub")
}