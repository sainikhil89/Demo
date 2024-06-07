#creating role with name Devopsb16testrole
module devopsb16role_iam {
    source = "./modules/iam"
    instanceprofilename = "Devopsb16test-inst-profile"
    rolename  = "Devopsb16testrole"
    envname = "${module.devopsb16-Devvpc.env}"
}

#creating a iam policy assigning to Devopsb16testrole
module devopsb16_iam_policy{
    source = "./modules/iam-attachments"
    policyname = "devopsb16-iam-policy1"
    attachroles = "${module.devopsb16role_iam.rolename}"
}