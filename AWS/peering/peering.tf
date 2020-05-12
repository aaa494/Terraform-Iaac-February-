resource "aws_vpc_peering_connection" "peer" {
  peer_owner_id = "483673462481"
  peer_vpc_id   = "vpc-065cebaaa8221828e"
  vpc_id        = "vpc-0013e586baf78c651"
}



# Use  resource "aws_vpc_peering_connection_accepter" to accept the peering conn-n