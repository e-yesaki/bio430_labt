#### -----------------------------------------------------------
#### Lab T Data Processing Script
#### Author: Emiko Yesaki
#### Date: 2026-02-11
#### -----------------------------------------------------------

library(tidyverse)

# 1. Load Raw Data

raw <- read_csv("data_raw_2025-03-26.csv",
                col_names = FALSE,
                show_col_types = FALSE)

# Helper: extract a block of rows by matching a header
extract_block <- function(df, header) {
  start <- which(df$X1 == header) + 1
  end <- start + 11  # enough rows for samples 1–7, A–D
  df[start:end, ] |> drop_na()
}

# 2. Extract Data Blocks

# Molar absorptivities
eps1 <- as.numeric(raw[which(raw$X1 == "??1"), 2])
eps2 <- as.numeric(raw[which(raw$X1 == "??2"), 2])

# pH values
ph_block <- extract_block(raw, "Sample,Measured pH")
colnames(ph_block) <- c("Sample", "pH")

# Absorbance at 435 nm
abs435_block <- extract_block(raw, "Sample,Absorbance at 435 nm")
colnames(abs435_block) <- c("Sample", "Abs_435")

# Absorbance at 593 nm
abs593_block <- extract_block(raw, "Sample,Absorbance at 593 nm")
colnames(abs593_block) <- c("Sample", "Abs_593")

# 3. Merge into one dataset

df <- ph_block |>
  left_join(abs435_block, by = "Sample") |>
  left_join(abs593_block, by = "Sample")

# Convert sample IDs to character
df$Sample <- as.character(df$Sample)

# 4. Normalize Absorbance

df <- df |>
  mutate(
    Norm_435 = (Abs_435 - min(Abs_435)) / (max(Abs_435) - min(Abs_435)),
    Norm_593 = (Abs_593 - min(Abs_593)) / (max(Abs_593) - min(Abs_593))
  )

# 5. Compute Concentrations Using Beer–Lambert Law

path_length <- 1  # cm

df <- df |>
  mutate(
    Conc_435 = Norm_435 / (eps1 * path_length),
    Conc_593 = Norm_593 / (eps2 * path_length)
  )

# 6. Compute Ratios and Log Ratios

df <- df |>
  mutate(
    Ratio = Conc_593 / Conc_435,
    log_Ratio = log10(Ratio)
  )

# 7. Estimate pKa

# Speciation midpoint: Ratio = 1
pKa_speciation <- df$pH[which.min(abs(df$Ratio - 1))]

# Henderson–Hasselbalch regression
hh_fit <- lm(pH ~ log_Ratio, data = df)
pKa_HH <- coef(hh_fit)[1]  # intercept

# 8. Save Processed Data

df_processed <- df |>
  mutate(
    pKa_speciation = pKa_speciation,
    pKa_HH = pKa_HH
  )

write_csv(df_processed, "tdata_processed_2026-02-12.csv")

# 9. Print Summary

cat("Processing complete.\n")
cat("Estimated pKa (speciation):", round(pKa_speciation, 3), "\n")
cat("Estimated pKa (H-H):", round(pKa_HH, 3), "\n")