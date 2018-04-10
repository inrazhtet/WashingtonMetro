# WashingtonMetro
### Fare Evasion Investigation

*This repository is **not** for reproducibility. It is to highlight a small portion of the work I have done via some code snippets. The datasets are under strict confidentiality agreement.*

#### Problem Statement
The Washington Metro loses substantial amount of revenue each year to fare evaders (people who hop on bus without paying anything).

#### Objective
Our goal is to use existing administrative data along with American Community Survey data at the census block level to find a narrative on where the most fare evasion is happening and why it is so.

#### Team
The lead Principal Investigator of the team was [Vicki Lancaster](https://www.bi.vt.edu/faculty/Vicki-Lancaster). Lata Kodali, a Ph.D. student in Statistics at Virginia Tech and I were the two Data Science for Public Good Fellows on the team. We co-led a team of 4 undergraduate interns from Virginia Tech for this project.

#### Deliverables
We presented our findings to the executives at the Washington Metro Transport Authority. We also did a symposium poster on some of our work which is in this repo under **WMATAFindings.pdf**

#### Datasets

Some of the datasets used in the project are as below:
1. Bus Stops (10,988 observations): bus stopID, latitude and longitude.
2. Approximate Person Counter (3,793,655 observations): front & back door entries and exits for a bus, route, trip and bus stop.
3. Farebox (2,729,688 observations): fare evasion key presses, cash and smart transaction by bus, trip and bus stop.

#### Some of my contributions to the project

1. Mentoring undergraduate students in R programming
2. Creating data dictionaries
3. Data processing: standardizing time, pulling in GTFS data for joining tables, writing scaffold code for undergradutes to do data exploration on GIS map etc.
4. Data generation: creating synthetic tripID (code snippet in this repo), calculating backdoor exits by census block groups etc.
5. Data exploration: Looking at overcrowding (code snippet in this repo) and fare evasion correlation etc. 

#### Code snippets

1. **SyntheticTripID.R**: This code file is to demonstrate my familiarity with dplyr in using it to process over millions of rows of data.
2. **Overcrowding.R**: This code file is to demonstrate a use of a chain of ifelse statements via mutate in exploring overcrowding on buses.


