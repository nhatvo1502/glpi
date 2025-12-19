module "network" {
    source = "./modules/network"
}

module "resources" {
    source = "./modules/resources"
    vpc_id = module.network.vpc_id
    subnet_id = module.network.subnet_id
}