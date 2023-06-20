resource "random_password" "user_password" {
  length = 12
}

resource "local_file" "secrets" {
  filename = "secrets.txt"
  content  = "The password for the user is '' and te lenght is ''"
}

