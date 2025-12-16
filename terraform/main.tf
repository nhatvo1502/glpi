module "network" {
    source = "./network"
}

module "resources" {
    source = "./resources"
    vpc_id = module.network.vpc_id
}