## scripts/session_info.R
## Save R session information for reproducibility.

sink("results/session_info.txt")
sessionInfo()
sink()

message("Session information saved to results/session_info.txt")
