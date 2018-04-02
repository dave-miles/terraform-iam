resource "aws_iam_user" "user" {
  count = "${length(var.user_names)}"
  name  = "${
    lookup(
      var.user_names[count.index],
      "name"
    )
  }"
  user_path  = "${
    lookup(
      var.user_names[count.index],
      "user_path",
      "${var.user_path}"
    )
  }"
  force_destroy = "${
    lookup(
      var.user_names[count.index],
      "force_destroy",
      "${var.force_destroy}"
    )
  }"
}

resource "aws_iam_user_login_profile" "user_login" {
  count                   = "${length(var.user_names)}"
  user                    = "${element(aws_iam_user.user.*.name, count.index)}"
  pgp_key                 = "${
    lookup(
      var.user_names[count.index],
      "pgp_key",
      "${var.pgp_key}"
    )
  }"
  password_reset_required = "${
    lookup(
      var.user_names[count.index],
      "password_reset_required",
      "true"
    )
  }"
}
