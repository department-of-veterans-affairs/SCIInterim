require 'set'

module DomainSeeds
  module MigrationHelper
    def enum_to_domain(table_name, domain_table_name, attribute_name, options = {})
      if !options.has_key?(:seed_entries) || options[:seed_entries]
        DomainSeeds.send("seed_#{domain_table_name}")
      end
      add_foreign_key table_name, domain_table_name, column: attribute_name
    end

    def domain_to_enum(table_name, attribute_name)
      remove_foreign_key table_name, column: attribute_name
    end
  end

  ASIA_CLASSIFICATION_MAP = {
    1 => "A",
    2 => "B",
    3 => "C",
    4 => "D",
    5 => "E"
  }

  BLADDER_DRAINAGE_METHOD_MAP = {
    1 => "BA - Bladder Augmentation",
    2 => "EC - Condom/External Catheter",
    3 => "IC - Intermittent Catheterization",
    4 => "IN - Indwelling Catheter",
    5 => "IP - Ileal Pouch",
    6 => "SC - Suprapubic Catheter",
    7 => "SS - Surgical Stent",
    8 => "VV - Voluntary Voiding",
  }
  CAREGIVER_TYPE_MAP = {
    1 => "No Caregiver",
    2 => "Paid Family",
    3 => "Unpaid Family",
    4 => "Paid Non-family",
    5 => "Unpaid Non-family",
  }
  CHART_SF_AT_HOME_COGNITIVE_MAP = {
    1 => "Someone else is always with me to observer or supervise",
    2 => "Someone else is always around, but they only check on me now and then",
    3 => "Sometimes I am left alone for an hour or two",
    4 => "Sometimes I am left alone for most of the day",
    5 => "I have been left alone all day and all night, but someone checks in on me",
    6 => "I am left alone without anyone checking on me",
  }
  CHART_SF_AWAY_NIGHT_MAP = {
    1 => "None",
    2 => "1-2",
    3 => "3-4",
    4 => "5 or more",
  }
  CHART_SF_HOUSEHOLD_INCOME_MAP = {
    1 => "Less than 10,000",
    2 => "10,000 - 14,999",
    3 => "15,000 - 19,999",
    4 => "20,000 - 24,999",
    5 => "25,000 - 34,999",
    6 => "35,000 - 49,999",
    7 => "50,000 - 74,999",
    8 => "75,000 or more",
    9 => "Don't know",
    10 => "Refused",
  }
  CHART_SF_INITIATED_STRANGER_CONVERSATION_MAP = {
    1 => "None",
    2 => "1-2",
    3 => "3-5",
    4 => "6 or more",
  }
  CHART_SF_MEDICAL_EXPENSE_MAP = {
    1 => "Less than 1,000",
    2 => "1,000 - 2,499",
    3 => "2,500 - 4,999",
    4 => "5,000 - 9,999",
    5 => "10,000 or more",
    9 => "Don't know",
    10 => "Refused",
  }
  CHART_SF_NOT_HOME_COGNITIVE_MAP = {
    1 => "I am restricted from leaving, even with someone else",
    2 => "Someone is always with me to help with remembering, decision-making or judgement when I go anywhere",
    3 => "I go to place on my own as long as they are familiar",
    4 => "I do not need help going anywhere",
  }
  CHART_SF_SPOUSE_RESIDENT_OPTION_MAP = {
    1 => "Yes",
    2 => "No",
    3 => "Not applicable (subject lives alone)",
  }

  ETHNIC_MAP = {
    1 => "Not Provided",
    2 => "Hispanic or Latino",
    3 => "Not Hispanic or Latino"
  }

  FIM_ADMISSION_CLASS_MAP = {
    1 => "Initial Rehabilitation",
    2 => "Short Stay Eval",
    3 => "Unplanned D/C",
    4 => "Readmission",
    5 => "Continuing Rehab",
  }
  FIM_IMPAIRMENT_CATEGORY_MAP = {
    1 => "4.1 SCD - Non-Traumatic Spinal Cord Dysfunction",
    2 => "4.2 SCD - Traumatic Spinal Cord Dysfunction",
  }
  FIM_IMPAIRMENT_GROUP_MAP = {
    1 => "4.11 Non-Traumatic Paraplegia, Unspecified",
    2 => "4.111 Non-Traumatic Incomplete Paraplegia",
    3 => "4.112 Non-Traumatic Complete Paraplegia",
    4 => "4.12 Non-Traumatic Quadriplegia Unspecified",
    5 => "4.1211 Non-Traumatic Quadriplegia Incomplete C1-4",
    6 => "4.1212 Non-Traumatic Quadriplegia Incomplete C5-8",
    7 => "4.1221 Non-Traumatic Quadriplegia Complete C1-4",
    8 => "4.1222 Non-Traumatic Quadriplegia Complete C5-8",
    9 => "4.13 Other Non-Traumatic SC",
    10 => "4.21 Traumatic Paraplegia, Unspecified",
    11 => "4.211 Traumatic Incomplete Paraplegia",
    12 => "4.212 Traumatic Complete Paraplegia",
    13 => "4.22 Traumatic Quadriplegia, Unspecified",
    14 => "4.2211 Traumatic Quadriplegia Incomplete C1-4",
    15 => "4.2212 Traumatic Quadriplegia Incomplete C5-8",
    16 => "4.2221 Traumatic Quadriplegia Complete C1-4",
    17 => "4.2222 Traumatic Quadriplegia Complete C5-8",
    18 => "4.23 Other Traumatic SC",
  }
  FIM_LOCOMOTION_TYPE_MAP = {
    1 => "Walk",
    2 => "Wheelchair",
    3 => "Both"
  }
  FIM_COMMUNICATION_COMPREHENSION_TYPE_MAP = {
    1 => "Auditory",
    2 => "Visual",
    3 => "Both",
  }
  FIM_COMMUNICATION_EXPRESSION_TYPE_MAP = {
    1 => "Vocal",
    2 => "Non-vocal",
    3 => "Both",
  }
  FIM_MEASUREMENT_MAP = {
    1 => "Total Assistance (performs less than 25% of task)",
    2 => "Maximal Assistance (performs 25%-49% of task)",
    3 => "Moderate Assistance (performs 50%-74% of task)",
    4 => "Minimal Contact Assistance (performs 75% or more of task)",
    5 => "Supervision of Setup (cuing, coaxing, prompting)",
    6 => "Modified Independence (extra time, devices)",
    7 => "Complete Independence (timely, safely)",
  }
  GENDER_MAP = {
    # TODO(awong): This is a very VERY limited set of genders. Currently
    # stuck this way because we need to reconcile with a legacy system.
    # Find a way to extend the list to encompass the full complexity of
    # gender identity.
    1 => "Female",
    2 => "Male",
    3 => "Unknown",
  }
  HIGHEST_LEVEL_OF_EDUCATION_MAP = {
    1 => "No Diploma",
    2 => "High School",
    3 => "Trade School",
    4 => "Some College",
    5 => "College",
    6 => "Graduate School",
  }
  KURTZKE_EDSS_SCORE_MAP = {
    1 => "0.0 - Normal neurologic examination (all grade 0 in Functional Systems [FS]; Cerebral grade 1 acceptable).",
    2 => "1.0 - No disability, minimal signs in one FS (i.e., grade 1 excluding Cerebral grade 1).",
    3 => "1.5 - No disability, minimal signs in more than one FS (more than one grade 1 excluding Cerebral grade 1).",
    4 => "2.0 - Minimal disability in one FS (one FS grade 2, others 0 or 1).",
    5 => "2.5 - Minimal disability in two FS (two FS grade 2, others 0 or 1).",
    6 => "3.0 - Moderate disability in one FS (one FS grade 3, others 0 or 1), or mild disability in three or four FS (three/four FS grade 2, others 0 or 1) though fully ambulatory.",
    7 => "3.5 - Fully ambulatory but with moderate disability in one FS (one grade 3) and one or two FS grade 2; or two FS grade 3; or five FS grade 2 (others 0 or 1).",
    8 => "4.0 - Fully ambulatory without aid, self-sufficient, up and about some 12 hours a day despite relatively severe disability consisting of one FS grade 4 (others 0 or 1) or combinations of lesser grades exceeding limits of previous steps. Able to walk without aid or rest some 500 meters.",
    9 => "4.5 - Fully ambulatory without aid, up and about much of the day, able to work a full day, may otherwise have some limitation of full activity or require minimal assistance; characterized by relatively severe disability, usually consisting of one FS grade 4 (others 0 or 1) or combinations of lesser grades exceeding limits of previous steps. Able to walk without aid or rest for some 300 meters.",
    10 => "5.0 - Ambulatory without aid or rest for about 200 meters; disability severe enough to impair full daily activities (e.g., to work full day without special provisions). (Usual FS equivalents are one grade 5 alone, others 0 or 1; or combinations of lesser grades usually exceeding specifications for step 4.0.)",
    11 => "5.5 - Ambulatory without aid or rest for about 100 meters; disability severe enough to preclude full daily activities. (Usual FS equivalents are one grade 5 alone, others 0 or 1; or combinations of lesser grades usually exceeding those for step 4.0).",
    12 => "6.0 - Intermittent or unilateral constant assistance (cane, crutch, or brace) required to walk about 100 meters with or without resting. (Usual FS equivalents are combinations with more than two FS grade 3+.)",
    13 => "6.5 - Constant bilateral assistance (canes, crutches, or braces) required to walk about 20 meters without resting. (Usual FS equivalents are combinations with more than two FS grade 3+.)",
    14 => "7.0 - Unable to walk beyond about 5 meters even with aid, essentially restricted to wheelchair; wheels self in standard wheelchair and transfers alone; up and about in some 12 hours a day. (Usual FS equivalents are combinations with more than one FS grade 4+; very rarely, pyramidal grade 5 alone.)",
    15 => "7.5 - Unable to take more than a few steps; restricted to wheelchair; may need aid in transfer; wheels self but cannot carry on in standard wheelchair a full day; may require motorized wheelchair. (Usual FS equivalents are combinations with more than one FS grade 4+.)",
    16 => "8.0 - Essentially restricted to bed or chair or perambulated in wheelchair, but may be out of bed itself much of the day; retains many self-care functions; generally has effective use of arms. (Usual FS equivalents are combinations, generally grade 4+ in several systems.)",
    17 => "8.5 - Essentially restricted to bed much of the day; has some effective use of arm(s); retains some self-care functions. (Usual FS equivalents are combinations, generally grade 4+ in several systems.)",
    18 => "9.0 - Helpless bed patient; can communicate and eat. (Usual FS equivalents are combinations, mostly grade 4+.)",
    19 => "9.5 - Totally helpless bed patient; unable to communicate effectively or eat/swallow. (Usual FS equivalents are combinations, almost all grade 4+.)",
    20 => "10 - Death due to MS.",
  }
  LEVEL_OF_INJURIES_MAP = {
    1 => "WNL",
    2 => "C1",
    3 => "C2",
    4 => "C3",
    5 => "C4",
    6 => "C5",
    7 => "C6",
    8 => "C7",
    9 => "C8",
    10 => "T1",
    11 => "T2",
    12 => "T3",
    13 => "T4",
    14 => "T5",
    15 => "T6",
    16 => "T7",
    17 => "T8",
    18 => "T9",
    19 => "T10",
    20 => "T11",
    21 => "T12",
    22 => "L1",
    23 => "L2",
    24 => "L3",
    25 => "L4",
    26 => "L5",
    27 => "S1",
    28 => "S2",
    29 => "S3",
    30 => "S4-5",
  }
  OCCUPATION_MAP = {
    1 => "Working (competitive labor market, includes military)",
    2 => "Homemaker",
    3 => "On-the-job training",
    4 => "Sheltered workshop",
    5 => "Student",
    6 => "Unemployed (may or may not be looking for work)",
    7 => "Retired",
    8 => "Other, unclassified (includes volunteer, disability or medical leave)",
    9 => "Unknown",
  }
  PRINCIPLE_PCP_VA_NONVA_MAP = {
    1 => "VA",
    2 => "NonVA",
    3 => "Other",
  }

  RACE_MAP = {
    1 => "Not Provided",
    2 => "American Indian or Alaskan Native",
    3 => "Asian",
    4 => "Black or African American",
    5 => "Native Hawaiian or Other Pacific Islander",
    6 => "White"
  }

  REASON_FOR_ADMISSION = {
    1 => "Newly injured",
    2 => "Deconditioned",
    3 => "Transition to home",
    4 => "Other",
  }
  RESIDENCE_TYPE_MAP = {
    1 => "01 Private residence",
    2 => "02 Hospital",
    3 => "03 Nursing home",
    4 => "04 Assisted living residence",
    5 => "05 Group living situation",
    6 => "06 Correctional institution",
    7 => "07 Hotel or motel",
    8 => "08 Homeless",
    9 => "09 Deceased",
   10 => "10 Other, unclassified",
   99 => "99 Unknown",
  }
  SCI_HUB_MAP = {
    1 => { station: "501", visn: 18, name: "Albuquerque" },
    2 => { station: "509", visn: 7, name: "Augusta" },
    3 => { station: "523", visn: 1, name: "Boston" },
    4 => { station: "526", visn: 3, name: "Bronx" },
    5 => { station: "620A4", visn: 3, name: "Castle Point" },
    6 => { station: "541", visn: 10, name: "Cleveland" },
    7 => { station: "549", visn: 17, name: "Dallas" },
    8 => { station: "561", visn: 3, name: "East Orange" },
    9 => { station: "590", visn: 6, name: "Hampton" },
    10 => { station: "578", visn: 12, name: "Hines" },
    11 => { station: "580", visn: 16, name: "Houston" },
    12 => { station: "600", visn: 22, name: "Long Beach" },
    13 => { station: "614", visn: 9, name: "Memphis" },
    14 => { station: "546", visn: 8, name: "Miami" },
    15 => { station: "695", visn: 12, name: "Milwaukee" },
    16 => { station: "618", visn: 23, name: "Minneapolis" },
    17 => { station: "640", visn: 21, name: "Palo Alto" },
    18 => { station: "652", visn: 6, name: "Richmond" },
    19 => { station: "671", visn: 17, name: "San Antonio" },
    20 => { station: "664", visn: 22, name: "San Diego" },
    21 => { station: "672", visn: 8, name: "San Juan" },
    22 => { station: "663", visn: 20, name: "Seattle" },
    23 => { station: "528A7", visn: 2, name: "Syracuse" },
    24 => { station: "657", visn: 15, name: "St Louis" },
    25 => { station: "673", visn: 8, name: "Tampa" },
  }
  SCI_TYPE_MAP = {
    1 => "Unknown",
    2 => "High Tetraplegic",
    3 => "Low Tetraplegic",
    4 => "Paraplegic",
  }
  SCID_ELIGIBILITY_MAP = {
    1 => "SCI",
    2 => "MS",
    3 => "ALS",
    4 => "Other",
  }

  SCID_ETIOLOGY_MAP = {
    1 => "Sports",
    2 => "Assault",
    3 => "Transport",
    4 => "Fall",
    5 => "Other traumatic cause",
    6 => "Non-traumatic spinal cord dysfunction",
    7 => "Unspecified or Unknown",
    8 => "Non-traumatic columnar disease(NCD)",
    9 => "Non-traumatic autoimmune or inflammatory other than MS (NIM)"
  }

  SCID_MS_ELIGIBILITY_MAP = {
    1 => "Relapsing-Remitting",
    2 => "Secondary-Progressive",
    3 => "Primary-Progressive",
    4 => "Progressive-Relapsing"
  }

  THEATER_OF_SERVICE_MAP = {
    1 => "NONE",
    2 => "OEF/OIF",
    3 => "OND",
  }
  TRAVEL_STATUS_MAP = {
    1 => "Not Eligible",
    2 => ">=30% more",
    3 => "VA pension",
    4 => "Benefit Travel Waiver",
  }
  VA_MEDICAL_CENTER_MAP = {
    1 => { station: "402", visn: 1, name: "Togus VA Medical Center" },
    2 => { station: "405", visn: 1, name: "White River Junction VA Medical Center" },
    3 => { station: "518", visn: 1, name: "Edith Nourse Rogers Memorial Veterans' Hospital" },
    4 => { station: "523", visn: 1, name: "Jamaica Plain VA Medical Center" },
    5 => { station: "523A4", visn: 1, name: "West Roxbury VA Medical Center" },
    6 => { station: "523A5", visn: 1, name: "Brockton VA Medical Center" },
    7 => { station: "608", visn: 1, name: "Manchester VA Medical Center" },
    8 => { station: "631", visn: 1, name: "Edward P. Boland Department of Veterans Affairs Medical Center" },
    9 => { station: "650", visn: 1, name: "Providence VA Medical Center" },
    10 => { station: "689", visn: 1, name: "West Haven VA Medical Center" },
    11 => { station: "689A4", visn: 1, name: "Newington VA Medical Center" },
    12 => { station: "528", visn: 2, name: "Buffalo VA Medical Center" },
    13 => { station: "528A4", visn: 2, name: "Batavia VA Medical Center" },
    14 => { station: "528A5", visn: 2, name: "Canandaigua VA Medical Center" },
    15 => { station: "528A6", visn: 2, name: "Bath VA Medical Center" },
    16 => { station: "528A7", visn: 2, name: "Syracuse VA Medical Center" },
    17 => { station: "528A8", visn: 2, name: "Samuel S. Stratton Department of Veterans Affairs Medical Center" },
    18 => { station: "526", visn: 3, name: "James J. Peters Department of Veterans Affairs Medical Center" },
    19 => { station: "561", visn: 3, name: "East Orange VA Medical Center" },
    20 => { station: "561A4", visn: 3, name: "Lyons VA Medical Center" },
    21 => { station: "620", visn: 3, name: "Franklin Delano Roosevelt Hospital" },
    22 => { station: "620A4", visn: 3, name: "Castle Point VA Medical Center" },
    23 => { station: "630", visn: 3, name: "Manhattan VA Medical Center" },
    24 => { station: "630A4", visn: 3, name: "Brooklyn VA Medical Center" },
    25 => { station: "630A5", visn: 3, name: "St. Albans VA Medical Center" },
    26 => { station: "632", visn: 3, name: "Northport VA Medical Center" },
    27 => { station: "460", visn: 4, name: "Wilmington VA Medical Center" },
    28 => { station: "503", visn: 4, name: "James E. Van Zandt Veterans' Administration Medical Center" },
    29 => { station: "529", visn: 4, name: "Butler VA Medical Center" },
    30 => { station: "540", visn: 4, name: "Louis A. Johnson Veterans' Administration Medical Center" },
    31 => { station: "542", visn: 4, name: "Coatesville VA Medical Center" },
    32 => { station: "562", visn: 4, name: "Erie VA Medical Center" },
    33 => { station: "595", visn: 4, name: "Lebanon VA Medical Center" },
    34 => { station: "642", visn: 4, name: "Philadelphia VA Medical Center" },
    35 => { station: "646", visn: 4, name: "Pittsburgh VA Medical Center-University Drive" },
    36 => { station: "646A4", visn: 4, name: "H. John Heinz III Department of Veterans Affairs Medical Center" },
    37 => { station: "693", visn: 4, name: "Wilkes-Barre VA Medical Center" },
    38 => { station: "512", visn: 5, name: "Baltimore VA Medical Center" },
    39 => { station: "512A5", visn: 5, name: "Perry Point VA Medical Center" },
    40 => { station: "613", visn: 5, name: "Martinsburg VA Medical Center" },
    41 => { station: "688", visn: 5, name: "Washington VA Medical Center" },
    42 => { station: "517", visn: 6, name: "Beckley VA Medical Center" },
    43 => { station: "558", visn: 6, name: "Durham VA Medical Center" },
    44 => { station: "565", visn: 6, name: "Fayetteville VA Medical Center" },
    45 => { station: "590", visn: 6, name: "Hampton VA Medical Center" },
    46 => { station: "637", visn: 6, name: "Charles George Department of Veterans Affairs Medical Center" },
    47 => { station: "652", visn: 6, name: "Hunter Holmes McGuire Hospital" },
    48 => { station: "658", visn: 6, name: "Salem VA Medical Center" },
    49 => { station: "659", visn: 6, name: "W.G. (Bill) Hefner Salisbury Department of Veterans Affairs Medical Center" },
    50 => { station: "508", visn: 7, name: "Atlanta VA Medical Center" },
    51 => { station: "509", visn: 7, name: "Charlie Norwood Department of Veterans Affairs Medical Center" },
    52 => { station: "509A0", visn: 7, name: "Augusta VA Medical Center-Uptown" },
    53 => { station: "521", visn: 7, name: "Birmingham VA Medical Center" },
    54 => { station: "534", visn: 7, name: "Ralph H. Johnson Department of Veterans Affairs Medical Center" },
    55 => { station: "544", visn: 7, name: "Wm. Jennings Bryan Dorn Department of Veterans Affairs Medical Center" },
    56 => { station: "557", visn: 7, name: "Carl Vinson Veterans' Administration Medical Center" },
    57 => { station: "619", visn: 7, name: "Central Alabama VA Medical Center-Montgomery" },
    58 => { station: "619A4", visn: 7, name: "Central Alabama VA Medical Center-Tuskegee" },
    59 => { station: "679", visn: 7, name: "Tuscaloosa VA Medical Center" },
    60 => { station: "516", visn: 8, name: "C.W. Bill Young Department of Veterans Affairs Medical Center" },
    61 => { station: "546", visn: 8, name: "Bruce W. Carter Department of Veterans Affairs Medical Center" },
    62 => { station: "548", visn: 8, name: "West Palm Beach VA Medical Center" },
    63 => { station: "573", visn: 8, name: "Malcom Randall Department of Veterans Affairs Medical Center" },
    64 => { station: "573A4", visn: 8, name: "Lake City VA Medical Center" },
    65 => { station: "672", visn: 8, name: "San Juan VA Medical Center" },
    66 => { station: "673", visn: 8, name: "James A. Haley Veterans' Hospital" },
    67 => { station: "675", visn: 8, name: "Orlando VA Medical Center" },
    68 => { station: "581", visn: 9, name: "Huntington VA Medical Center" },
    69 => { station: "596", visn: 9, name: "Lexington VA Medical Center-Leestown" },
    70 => { station: "596A4", visn: 9, name: "Lexington VA Medical Center-Cooper" },
    71 => { station: "603", visn: 9, name: "Robley Rex Department of Veterans Affairs Medical Center" },
    72 => { station: "614", visn: 9, name: "Memphis VA Medical Center" },
    73 => { station: "621", visn: 9, name: "James H. Quillen Department of Veterans Affairs Medical Center" },
    74 => { station: "626", visn: 9, name: "Nashville VA Medical Center" },
    75 => { station: "626A4", visn: 9, name: "Alvin C. York Veterans' Administration Medical Center" },
    76 => { station: "538", visn: 10, name: "Chillicothe VA Medical Center" },
    77 => { station: "539", visn: 10, name: "Cincinnati VA Medical Center" },
    78 => { station: "539A4", visn: 10, name: "Cincinnati VA Medical Center-Fort Thomas" },
    79 => { station: "541", visn: 10, name: "Louis Stokes Cleveland Department of Veterans Affairs Medical Center" },
    80 => { station: "552", visn: 10, name: "Dayton VA Medical Center" },
    81 => { station: "506", visn: 11, name: "Ann Arbor VA Medical Center" },
    82 => { station: "515", visn: 11, name: "Battle Creek VA Medical Center" },
    83 => { station: "550", visn: 11, name: "Danville VA Medical Center" },
    84 => { station: "553", visn: 11, name: "John D. Dingell Department of Veterans Affairs Medical Center" },
    85 => { station: "583", visn: 11, name: "Richard L. Roudebush Veterans' Administration Medical Center" },
    86 => { station: "610", visn: 11, name: "Marion VA Medical Center" },
    87 => { station: "610A4", visn: 11, name: "Fort Wayne VA Medical Center" },
    88 => { station: "655", visn: 11, name: "Aleda E. Lutz Department of Veterans Affairs Medical Center" },
    89 => { station: "537", visn: 12, name: "Jesse Brown Department of Veterans Affairs Medical Center" },
    90 => { station: "556", visn: 12, name: "Captain James A. Lovell Federal Health Care Center" },
    91 => { station: "578", visn: 12, name: "Edward Hines Junior Hospital" },
    92 => { station: "585", visn: 12, name: "Oscar G. Johnson Department of Veterans Affairs Medical Facility" },
    93 => { station: "607", visn: 12, name: "William S. Middleton Memorial Veterans' Hospital" },
    94 => { station: "676", visn: 12, name: "Tomah VA Medical Center" },
    95 => { station: "695", visn: 12, name: "Clement J. Zablocki Veterans' Administration Medical Center" },
    96 => { station: "589", visn: 15, name: "Kansas City VA Medical Center" },
    97 => { station: "589A4", visn: 15, name: "Harry S. Truman Memorial Veterans' Hospital" },
    98 => { station: "589A5", visn: 15, name: "Colmery-O'Neil Veterans' Administration Medical Center" },
    99 => { station: "589A6", visn: 15, name: "Dwight D. Eisenhower Department of Veterans Affairs Medical Center" },
    100 => { station: "589A7", visn: 15, name: "Robert J. Dole Department of Veterans Affairs Medical and Regional Office Center" },
    101 => { station: "657", visn: 15, name: "John Cochran Veterans Hospital" },
    102 => { station: "657A0", visn: 15, name: "St. Louis VA Medical Center-Jefferson Barracks" },
    103 => { station: "657A4", visn: 15, name: "John J. Pershing Veterans' Administration Medical Center" },
    104 => { station: "657A5", visn: 15, name: "Marion VA Medical Center" },
    105 => { station: "502", visn: 16, name: "Alexandria VA Medical Center" },
    106 => { station: "520", visn: 16, name: "Biloxi VA Medical Center" },
    107 => { station: "564", visn: 16, name: "Fayetteville VA Medical Center" },
    108 => { station: "580", visn: 16, name: "Michael E. DeBakey Department of Veterans Affairs Medical Center" },
    109 => { station: "586", visn: 16, name: "G.V. (Sonny) Montgomery Department of Veterans Affairs Medical Center" },
    110 => { station: "598", visn: 16, name: "John L. McClellan Memorial Veterans' Hospital" },
    111 => { station: "598A0", visn: 16, name: "Eugene J. Towbin Healthcare Center" },
    112 => { station: "623", visn: 16, name: "Jack C. Montgomery Department of Veterans Affairs Medical Center" },
    113 => { station: "635", visn: 16, name: "Oklahoma City VA Medical Center" },
    114 => { station: "667", visn: 16, name: "Overton Brooks Veterans' Administration Medical Center" },
    115 => { station: "549", visn: 17, name: "Dallas VA Medical Center" },
    116 => { station: "549A4", visn: 17, name: "Sam Rayburn Memorial Veterans Center" },
    117 => { station: "671", visn: 17, name: "Audie L. Murphy Memorial Veterans' Hospital" },
    118 => { station: "671A4", visn: 17, name: "Kerrville VA Medical Center" },
    119 => { station: "674", visn: 17, name: "Olin E. Teague Veterans' Center" },
    120 => { station: "674A4", visn: 17, name: "Doris Miller VA Medical Center - Waco" },
    121 => { station: "501", visn: 18, name: "Raymond G. Murphy Department of Veterans Affairs Medical Center" },
    122 => { station: "504", visn: 18, name: "Thomas E. Creek Department of Veterans Affairs Medical Center" },
    123 => { station: "519", visn: 18, name: "George H. O'Brien, Jr." },
    124 => { station: "644", visn: 18, name: "Carl T. Hayden Veterans' Administration Medical Center" },
    125 => { station: "649", visn: 18, name: "Bob Stump Department of Veterans Affairs Medical Center" },
    126 => { station: "678", visn: 18, name: "Tucson VA Medical Center" },
    127 => { station: "436", visn: 19, name: "Fort Harrison VA Medical Center" },
    128 => { station: "436A4", visn: 19, name: "Miles City VA Medical Center" },
    129 => { station: "442", visn: 19, name: "Cheyenne VA Medical Center" },
    130 => { station: "554", visn: 19, name: "Denver VA Medical Center" },
    131 => { station: "575", visn: 19, name: "Grand Junction VA Medical Center" },
    132 => { station: "660", visn: 19, name: "George E. Wahlen Department of Veterans Affairs Medical Center" },
    133 => { station: "666", visn: 19, name: "Sheridan VA Medical Center" },
    134 => { station: "463", visn: 20, name: "Anchorage VA Medical Center" },
    135 => { station: "531", visn: 20, name: "Boise VA Medical Center" },
    136 => { station: "648", visn: 20, name: "Portland VA Medical Center" },
    137 => { station: "648A4", visn: 20, name: "Portland VA Medical Center-Vancouver" },
    138 => { station: "653", visn: 20, name: "Roseburg VA Medical Center" },
    139 => { station: "663", visn: 20, name: "Seattle VA Medical Center" },
    140 => { station: "663A4", visn: 20, name: "American Lake VA Medical Center" },
    141 => { station: "668", visn: 20, name: "Mann-Grandstaff Department of Veterans Affairs Medical Center" },
    142 => { station: "687", visn: 20, name: "Jonathan M. Wainwright Memorial VA Medical Center" },
    143 => { station: "692", visn: 20, name: "White City VA Medical Center" },
    144 => { station: "459", visn: 21, name: "Spark M. Matsunaga Department of Veterans Affairs Medical Center" },
    145 => { station: "570", visn: 21, name: "Fresno VA Medical Center" },
    146 => { station: "612A4", visn: 21, name: "Sacramento VA Medical Center" },
    147 => { station: "640", visn: 21, name: "Palo Alto VA Medical Center" },
    148 => { station: "640A0", visn: 21, name: "Palo Alto VA Medical Center-Menlo Park" },
    149 => { station: "640A4", visn: 21, name: "Palo Alto VA Medical Center-Livermore" },
    150 => { station: "654", visn: 21, name: "Ioannis A. Lougaris Veterans' Administration Medical Center" },
    151 => { station: "662", visn: 21, name: "San Francisco VA Medical Center" },
    152 => { station: "593", visn: 22, name: "Las Vegas VA Medical Center" },
    153 => { station: "600", visn: 22, name: "Long Beach VA Medical Center" },
    154 => { station: "605", visn: 22, name: "Jerry L. Pettis Memorial Veterans' Hospital" },
    155 => { station: "664", visn: 22, name: "San Diego VA Medical Center" },
    156 => { station: "691", visn: 22, name: "West Los Angeles VA Medical Center" },
    157 => { station: "691A4", visn: 22, name: "Sepulveda VA Medical Center" },
    158 => { station: "437", visn: 23, name: "Fargo VA Medical Center" },
    159 => { station: "438", visn: 23, name: "Royal C. Johnson Veterans' Memorial Hospital" },
    160 => { station: "568", visn: 23, name: "Fort Meade VA Medical Center" },
    161 => { station: "568A4", visn: 23, name: "Hot Springs VA Medical Center" },
    162 => { station: "618", visn: 23, name: "Minneapolis VA Medical Center" },
    163 => { station: "636", visn: 23, name: "Omaha VA Medical Center" },
    164 => { station: "636A4", visn: 23, name: "Grand Island VA Medical Center" },
    165 => { station: "636A6", visn: 23, name: "Des Moines VA Medical Center" },
    166 => { station: "636A8", visn: 23, name: "Iowa City VA Medical Center" },
    167 => { station: "656", visn: 23, name: "St. Cloud VA Medical Center" },
  }
  VA_STATUS_MAP = {
    1 => "Active",
    2 => "Deactivate",
    3 => "On-Hold",
    4 => "Expired",
  }

  def self.seed_domain_asia_classifications
    update_domain_table(:domain_asia_classifications,
                        ASIA_CLASSIFICATION_MAP)
  end

  def self.seed_domain_bladder_drainage_methods
    update_domain_table(:domain_bladder_drainage_methods,
                        BLADDER_DRAINAGE_METHOD_MAP)
  end

  def self.seed_domain_caregiver_types
    update_domain_table(:domain_caregiver_types, CAREGIVER_TYPE_MAP)
  end

  def self.seed_domain_chart_sf_at_home_cognitives
    update_domain_table(:domain_chart_sf_at_home_cognitives,
                        CHART_SF_AT_HOME_COGNITIVE_MAP)
  end

  def self.seed_domain_chart_sf_away_nights
    update_domain_table(:domain_chart_sf_away_nights, CHART_SF_AWAY_NIGHT_MAP)
  end

  def self.seed_domain_chart_sf_household_incomes
    update_domain_table(:domain_chart_sf_household_incomes,
                        CHART_SF_HOUSEHOLD_INCOME_MAP)
  end

  def self.seed_domain_chart_sf_initiated_stranger_conversations
    update_domain_table(:domain_chart_sf_initiated_stranger_conversations,
                        CHART_SF_INITIATED_STRANGER_CONVERSATION_MAP)
  end

  def self.seed_domain_chart_sf_medical_expenses
    update_domain_table(:domain_chart_sf_medical_expenses,
                        CHART_SF_MEDICAL_EXPENSE_MAP)
  end

  def self.seed_domain_chart_sf_not_home_cognitives
    update_domain_table(:domain_chart_sf_not_home_cognitives,
                        CHART_SF_NOT_HOME_COGNITIVE_MAP)
  end

  def self.seed_domain_chart_sf_spouse_resident_options
    update_domain_table(:domain_chart_sf_spouse_resident_options,
                        CHART_SF_SPOUSE_RESIDENT_OPTION_MAP)
  end

  def self.seed_domain_ethnics
    update_domain_table(:domain_ethnics, ETHNIC_MAP)
  end

  def self.seed_domain_fim_admission_classes
    update_domain_table(:domain_fim_admission_classes,
                        FIM_ADMISSION_CLASS_MAP)
  end

  def self.seed_domain_fim_communication_comprehension_types
    update_domain_table(:domain_fim_communication_comprehension_types,
                        FIM_COMMUNICATION_COMPREHENSION_TYPE_MAP)
  end

  def self.seed_domain_fim_communication_expression_types
    update_domain_table(:domain_fim_communication_expression_types,
                        FIM_COMMUNICATION_EXPRESSION_TYPE_MAP)
  end

  def self.seed_domain_fim_impairment_categories
    update_domain_table(:domain_fim_impairment_categories,
                        FIM_IMPAIRMENT_CATEGORY_MAP)
  end

  def self.seed_domain_fim_impairment_groups
    update_domain_table(:domain_fim_impairment_groups,
                        FIM_IMPAIRMENT_GROUP_MAP)
  end

  def self.seed_domain_fim_locomotion_types
    update_domain_table(:domain_fim_locomotion_types, FIM_LOCOMOTION_TYPE_MAP)
  end

  def self.seed_domain_fim_measurements
    update_domain_table(:domain_fim_measurements, FIM_MEASUREMENT_MAP)
  end

  def self.seed_domain_genders
    update_domain_table(:domain_genders, GENDER_MAP)
  end

  def self.seed_domain_highest_level_of_educations
    update_domain_table(:domain_highest_level_of_educations,
                        HIGHEST_LEVEL_OF_EDUCATION_MAP)
  end

  def self.seed_domain_kurtzke_edss_scores
    update_domain_table(:domain_kurtzke_edss_scores,
                        KURTZKE_EDSS_SCORE_MAP)
  end

  def self.seed_domain_level_of_injuries
    update_domain_table(:domain_level_of_injuries, LEVEL_OF_INJURIES_MAP)
  end

  def self.seed_domain_occupations
    update_domain_table(:domain_occupations, OCCUPATION_MAP)
  end

  def self.seed_domain_principle_pcp_types
    update_domain_table(:domain_principle_pcp_types, PRINCIPLE_PCP_VA_NONVA_MAP)
  end

  def self.seed_domain_races
    update_domain_table(:domain_races, RACE_MAP)
  end

  def self.seed_domain_reason_for_admissions
    update_domain_table(:domain_reason_for_admissions, REASON_FOR_ADMISSION)
  end

  def self.seed_domain_residence_types
    update_domain_table(:domain_residence_types, RESIDENCE_TYPE_MAP)
  end

  def self.seed_domain_sci_hubs
    update_domain_table(:domain_sci_hubs, SCI_HUB_MAP)
  end

  def self.seed_domain_sci_types
    update_domain_table(:domain_sci_types, SCI_TYPE_MAP)
  end

  def self.seed_domain_scid_eligibilities
    update_domain_table(:domain_scid_eligibilities, SCID_ELIGIBILITY_MAP)
  end

  def self.seed_domain_scid_etiologies
    update_domain_table(:domain_scid_etiologies, SCID_ETIOLOGY_MAP)
  end

  def self.seed_domain_scid_ms_eligibilities
    update_domain_table(:domain_scid_ms_eligibilities, SCID_MS_ELIGIBILITY_MAP)
  end

  def self.seed_domain_theater_of_services
    update_domain_table(:domain_theater_of_services, THEATER_OF_SERVICE_MAP)
  end

  def self.seed_domain_travel_statuses
    update_domain_table(:domain_travel_statuses, TRAVEL_STATUS_MAP)
  end

  def self.seed_domain_va_medical_centers
    update_domain_table(:domain_va_medical_centers, VA_MEDICAL_CENTER_MAP)
  end

  def self.seed_domain_va_statuses
    update_domain_table(:domain_va_statuses, VA_STATUS_MAP)
  end

  def self.seed_all
    ActiveRecord::Base.transaction do
      seed_domain_asia_classifications
      seed_domain_bladder_drainage_methods
      seed_domain_caregiver_types
      seed_domain_chart_sf_at_home_cognitives
      seed_domain_chart_sf_away_nights
      seed_domain_chart_sf_household_incomes
      seed_domain_chart_sf_initiated_stranger_conversations
      seed_domain_chart_sf_medical_expenses
      seed_domain_chart_sf_not_home_cognitives
      seed_domain_chart_sf_spouse_resident_options
      seed_domain_ethnics
      seed_domain_fim_admission_classes
      seed_domain_fim_communication_comprehension_types
      seed_domain_fim_communication_expression_types
      seed_domain_fim_impairment_categories
      seed_domain_fim_impairment_groups
      seed_domain_fim_locomotion_types
      seed_domain_fim_measurements
      seed_domain_genders
      seed_domain_highest_level_of_educations
      seed_domain_kurtzke_edss_scores
      seed_domain_level_of_injuries
      seed_domain_occupations
      seed_domain_principle_pcp_types
      seed_domain_races
      seed_domain_reason_for_admissions
      seed_domain_residence_types
      seed_domain_sci_hubs
      seed_domain_sci_types
      seed_domain_scid_eligibilities
      seed_domain_scid_etiologies
      seed_domain_scid_ms_eligibilities
      seed_domain_theater_of_services
      seed_domain_travel_statuses
      seed_domain_va_medical_centers
      seed_domain_va_statuses
    end
  end

 private
  def self.generate_update_set_expr(value)
    set_expr = []
    if value.is_a?(Hash) then
      value.each { |key, value| set_expr << "#{key}=#{ActiveRecord::Base.connection.quote(value)}" }
    else
      set_expr << "name = #{ActiveRecord::Base.connection.quote(value)}"
    end
    "SET #{set_expr.join(",")}"
  end

  def self.generate_insert_value(id, value)
    keys = []
    values = []
    if value.is_a?(Hash) then
      value.each do |k, v|
        keys << k
        values << ActiveRecord::Base.connection.quote(v)
      end
      keys << "id"
      values << id
    else
      keys = [ "name", "id" ]
      values = [ ActiveRecord::Base.connection.quote(value), ActiveRecord::Base.connection.quote(id) ]
    end
    return "(#{keys.join(', ')}) values (#{values.join(', ')})"
  end

  def self.update_domain_table(table_name, value_map)
    ActiveRecord::Base.transaction do
      result = ActiveRecord::Base.connection.execute("SELECT id from #{table_name}")
      # PG:Results come back as an array of arrays even if it's a single value per row.
      existing_ids = result.values.inject(Set.new) { |memo, id| memo << id.first.to_i }
      key_set = Set.new(value_map.keys)

      (key_set & existing_ids).each do |id|
        ActiveRecord::Base.connection.execute(
          "UPDATE #{table_name} #{generate_update_set_expr(value_map[id])} WHERE id = #{ActiveRecord::Base.connection.quote(id)}")
      end

      (key_set - existing_ids).each do |id|
        ActiveRecord::Base.connection.execute(
          "INSERT INTO #{table_name} #{generate_insert_value(id, value_map[id])}")
      end

      to_delete = (existing_ids - key_set).map { |id| ActiveRecord::Base.connection.quote(id) }
      ActiveRecord::Base.connection.execute("DELETE FROM #{table_name} where id in (#{to_delete.join(',')})") if !to_delete.empty?
    end
  end
end
