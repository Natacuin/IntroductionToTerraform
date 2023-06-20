resource "local_file" "to_do_list" {
  filename        = var.name_of_to_do_list_file
  content         = "Daily1 Stand-up Meeting\nBug Fixing\nCode Review\nResearch and Learning"
  file_permission = "0700"
}

resource "local_file" "family_file" {
  filename        = var.family_list_file_name
  content         = "Daily1 Stand-up Meeting\nBug Fixing\nCode Review\nResearch and Learning"
  file_permission = "0700"
}

resource "local_file" "friends_file" {
  filename        = var.friends_list_file_name
  content         = "Daily1 Stand-up Meeting\nBug Fixing\nCode Review\nResearch and Learning"
  file_permission = "0700"
}


variable "name_of_to_do_list_file" {
}
