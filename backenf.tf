terraform {
  backend "gcs" {
    bucket  = "ar85-tf-state"
    prefix  = "review"
  }
}
