# When Fragmentation Meets Institutions

**Party System Fragmentation and Government Formation in European Parliamentary Democracies**

## Overview

This project examines whether party system fragmentation increases government formation duration across 14 European parliamentary democracies from 1970 to 2024. Using panel data from the ParlGov dataset, I find that the relationship between fragmentation and formation duration is primarily structural and cross-national rather than dynamic and within-country — suggesting that institutional context and coalition norms mediate the effects of fragmentation on governability.

A full research note is available in `paper/research_note.md`.

## Data

- **Source:** [ParlGov Dataset](http://www.parlgov.org) (Döring & Manow, 2024)
- **Countries:** Austria, Belgium, Denmark, Finland, Germany, Greece, Iceland, Ireland, Italy, the Netherlands, Norway, Portugal, Spain, Sweden
- **Period:** 1970–2024
- **Unit of observation:** Country-election (N = 214)

## Variables

| Variable | Description |
|---|---|
| `log_days` | Log(days to form government + 1) |
| `enp` | Effective Number of Parties (Laakso-Taagepera) |
| `largest_party_share` | Seat share of the largest party |
| `year` | Election year |

## Methods

OLS regression with country fixed effects and country-clustered standard errors, estimated using the `fixest` package in R. Three model specifications are reported, alongside two robustness checks using alternative dependent variables.

## Repository Structure

├── data/
│   ├── raw/          # Original ParlGov CSV files
│   └── processed/    # Cleaned and merged analysis dataset
├── notebooks/
│   ├── 01_data_preparation.R
│   ├── 02_descriptive_analysis.R
│   └── 03_regression_analysis.R
├── figures/          # All output figures
├── paper/
│   └── research_note.md
└── README.md

## Key Findings

- At the cross-national level, higher fragmentation is associated with longer government formation processes.
- Within-country variation in ENP shows no significant relationship with formation duration once country fixed effects are included (within R² = 0.057).
- The relationship becomes more visible when extreme formation episodes receive greater weight (raw duration model: β = 19.0, p < 0.05).
- Denmark illustrates how minority government norms can decouple fragmentation from formation complexity; Italy illustrates how party system restructuring creates non-linear ENP trajectories.

## Dependencies

R packages: `tidyverse`, `fixest`

## Author

Undergraduate researcher, Tsinghua University. Research interests: quantitative political science, comparative institutions, computational social science.​​​​​​​​​​​​​​​​