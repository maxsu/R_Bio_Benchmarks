# Install and load the bench package  [1]
install.packages("bench")
library(bench)

# Install and load the iterators package
install.packages("iterators")
library(iterators)


# Scenario A: Uncompressed file

# A1: Define an iterator version of the script
iter_script <- function() {
   # Create an iterator for a file
  file_iter <- ireadLines("sequence_file.txt")
  
  # Pass the iterator to suerat
  su_result <- suerat(file_iter)
}

# A2: Define a non-iterator version of the script
non_iter_script <- function() {
  # Read the whole file into memory
  file_data <- readLines("sequence_file.txt")
  
  # Pass the data to suerat
  su_result <- suerat(file_data)
}


# Scenario B: Compressed file

# B1: Define an iterator version of the script
comp_iter_script <- function() {
   # Create an iterator from a compressed file connection [2]
  comp_iter <- ireadLines(gzfile("sequence_file.txt.gz"))
  
  # Pass the iterator to suerat
  su_result <- suerat(comp_iter)
}

# B2: Define a non-iterator version of the script
comp_non_iter_script <- function() {
  # Read the whole file into memory
  file_data <- readLines("sequence_file.txt")
  
  # Pass the data to suerat
  su_result <- suerat(file_data)
}


# Benchmark and compare all versions of the script
bench::mark(
    A1_iter = iter_script(),
    A2_non_iter = non_iter_script(),
    B1_comp_iter = comp_iter_script(),
    B2_comp_non_iter = comp_non_iter_script(),
    check = FALSE,
)




# References
# [1] https://bench.r-lib.org/
# [2] https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/connections
# [3] https://cran.r-project.org/web/packages/iterators/iterators.pdf
# [4] https://mojaveazure.github.io/seurat-disk/ - h5 disc format, on-disk conversion to anndata
# [5] https://www.rdocumentation.org/packages/iterators/versions/1.0.14/topics/ireadLines
