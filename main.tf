provider "aws" {
    #access_key = "xxx"
    #secret_key = "xxx"
    region = "us-east-1"
}

    module devopsb16-Devvpc  {
      source = "./modules/vpc"
    vpc_cidr = "10.120.0.0/16"
    env = "test"
    #key_name = "laptop"
    azs = ["us-east-1a","us-east-1b","us-east-1c"]
    public_subnets = ["10.120.1.0/24", "10.120.2.0/24","10.120.3.0/24"]
    private_subnets = ["10.120.10.0/24", "10.120.20.0/24","10.120.30.0/24"]

    environment = "dev"
    }
#create a dev instance
    module devopsb16-Devec2  {
      source = "./modules/ec2"
    imagename = "ami-04b70fa74e45c3917"
    machinecount = "${module.devopsb16-Devvpc.env== "prod" ? 3 : 1}"
    iam_instance_profile = "${module.devopsb16role_iam.instprofile}"
    instance_type = "t2.micro"
    key_name = "dummy"
    public-subnets = "${module.devopsb16-Devvpc.publicsubnetall}"
    sgid  = "${module.devopsb16-Devvpc.securitygroup}"
    # subnet_id = module.devopsb16-Devvpc.publicsubnet01
    # sgid   = module.devopsb16-Devvpc.securitygroup
     env   = "Dev"
    }

    # module devopsb16-prodvpc  {
    #   source = "./modules/vpc"
    # vpc_cidr = "10.150.0.0/16"
    # env = "prod"
    # #key_name = "laptop"
    # publc_subnet01_cidr = "10.150.1.0/24"
    # publc_subnet02_cidr = "10.150.2.0/24"
    # publc_subnet03_cidr = "10.150.3.0/24"
    # environment = "Prod"
    # }
