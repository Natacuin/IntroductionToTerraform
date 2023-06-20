resource "local_file" "to_do_list" {
  filename        = "todo.txt"
  content         = "Daily1 Stand-up Meeting\nBug Fixing\nCode Review\nResearch and Learning"
  file_permission = "0700"
}
