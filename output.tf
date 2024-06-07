output "Devvpc" {
  value = module.devopsb16-Devvpc.vpcid
}

output "publicsubnets" {
  value = module.devopsb16-Devvpc.publicsubnetall
  }

output "environment" {
  value = module.devopsb16-Devvpc.env
}
# output "Prodvpc" {
#   value = module.devopsb16-prodvpc.vpcid
# }