get_data <- function(url, zip_file, data_files, output_dir="./data")
{
  if (!file.exists(output_dir))
    dir.create(output_dir)
  
  file_missing = FALSE
  for (data_file in data_files)
  {
    if (!file.exists(data_file))
      file_missing = TRUE
  }

  if (file_missing)
  {
    if (!file.exists(zip_file))
    {
      print(paste("Downloading ", url))
      download.file(url, zip_file, method="curl")
    }

    print(paste("Unzipping ", zip_file))
    unzip(zip_file, exdir=output_dir)
  }
}
