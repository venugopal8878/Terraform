data "aws_ami" "jiondevops" {
      most_recent = true
       owners = [973714476881]
       
    filter {
        name = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }
    # filter {
    #     name = "source"
    #     values = ["973714476881/RHEL-9-DevOps-Practice"]
    # }
}