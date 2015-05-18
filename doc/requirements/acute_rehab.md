## Acute Rehab
### START
Data Fields | Answer Choice | Note | Type
----------------|----------------------|--------|----------------
Date of Admission | Date field with calendar | | Date
ASIA | SCI Classification | Should have 2 fields "highest neurological level" and "impairment" | "High-tetra", "Low-tetra", "parapalegia", "multiple scaroliosis"
FIM | Functional Independence | Assuming FIM total | Integer [18, 126]
SWLS | Satisfaction with Life | Assuming a total | Integer [5, 35]
KURTZKE EDSS | Multiple Sclerosis | Range might be wrong. | Float [1, 10]

### GOAL
Data Fields | Answer Choice | Note | Type
----------------|----------------------|--------|----------------
FIM | Functional Independence | See attachment | Integer [18, 126]

### FINISH
Data Fields | Answer Choice | Note | Type
----------------|----------------------|--------|----------------
Date of Discharge | Date field with calendar  | | Date
ASIA | SCI Classification  | See attachment | "High-tetra", "Low-tetra"
FIM | Functional Independence | See attachment | Integer [18, 126]
KURTZKE EDSS | Multiple Sclerosis | See attachment | Float [1, 10]
USPEQ | Veteran Experience  | No clue what this is | String
Discharge Location | Drop Down box | List is incomplete | "Return to Community", "VA Nursing Home", "VA Hospital"

### FOLLOW UP - 90 Days
Data Fields | Answer Choice | Note | Type
----------------|----------------------|--------|----------------
90 Day Follow Up Date | Date field with calendar  | | Date
FIM | Functional Independence | See attachment | | Integer [18, 126]
SWLS | Satisfaction with Life | See attachment | | Integer [5, 35]
CHART-SF | Participation | See attachment | | Integer [0, 600]
SF-8 | Health Status     | See attachment | Has 2 component scores. Mental and physical. Unclear how to roll-up. | float


### FOLLOW UP - One Year
Data Fields | Answer Choice | Note | Type
----------------|----------------------|--------|----------------
One year follow up date | Date field with calendar  | | Date
FIM | Functional Independence | See attachment | | Integer [18, 126]
SWLS | Satisfaction with Life | See attachment | | Integer [5, 35]
CHART-SF | Participation | See attachment | | Integer [0, 600]
SF-8 | Health Status      | See attachment | Has 2 component scores. Mental and physical. Unclear how to roll-up. | float
