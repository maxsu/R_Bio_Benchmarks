# R_Bio_Benchmarks
Benchmarks relevant to bioinformatic workflows in R

## Benchmarks

### Suerat Loading: Iterator vs Noniterator

Problem: Suerat loading uses excessive memory

Proposed Cause: Suerat sample code decompresses sequence files directly into memory

Propose Solutions:
1. Use iterators
2. Extract sequences to disk prior to processing in R


Hypothesis:
1. Iterators reduce memory use by nearly 200%
2. Pre-extraction does not significantly reduce memory usage
