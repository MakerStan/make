---
title: "Analysis of Medicare 2012 Data"
author: "MakerStan"
created: "April 13, 2013"
edited: "April 13, 2013"
layout: "default"
isPage: true
preview: "Here is an analysis of about 9 millions records of Medicare data from 2012 that was made public by  Centers for Medicare & Medicaid Services (CMS)."
---
If you are interested in how I set up the data, please see [this post](google-bigquery-medicare.html).

**Total number of records:** 9,142,826
<pre>
bq query "SELECT COUNT(npi) as count FROM medicare.medicare_2012"
</pre>

**Number of Provider Types:** 89 
<pre>
bq query "SELECT SUM(COUNT(provider_type)) as sum FROM medicare.medicare_2012 GROUP BY provider_type"
</pre>

**Number of Providers:**<br /> 
Total=893,802<br /> 
Individual=847,181 (nppes_entity_code='I')<br />
Others=51,541 (nppes_entity_code='O')<br />
Miscellaneous=4 (nppes_entity_code='.')<br />
<pre>
bq query "SELECT SUM(COUNT(DISTINCT  npi)) as sum FROM medicare.medicare_2012"
</pre>

Number of entries for each Provider Type [is here](medicare-provider-types-sorted-numbered.txt).
<pre>
bq query "SELECT ROW_NUMBER() OVER() row_number, provider_type, count FROM (SELECT provider_type, COUNT(provider_type) as count FROM medicare.medicare_2012 GROUP BY provider_type order by count desc)"
</pre>
The top 10 Provider Types having the most number of entries are:
<pre>
+------------+---------------------------------------------+---------+
| row_number |                provider_type                |  count  |
+------------+---------------------------------------------+---------+
|          1 | Diagnostic Radiology                        | 1226827 |
|          2 | Internal Medicine                           | 1197204 |
|          3 | Family Practice                             |  970544 |
|          4 | Cardiology                                  |  535268 |
|          5 | Orthopedic Surgery                          |  316510 |
|          6 | Nurse Practitioner                          |  270502 |
|          7 | Ophthalmology                               |  234633 |
|          8 | Anesthesiology                              |  218190 |
|          9 | Physician Assistant                         |  218076 |
|         10 | Emergency Medicine                          |  216668 |
</pre>
The bottom 10 Provider Types having the least number of entries are:
<pre>
|         80 | Unknown Physician Specialty Code            |     788 |
|         81 | Geriatric Psychiatry                        |     760 |
|         82 | Neuropsychiatry                             |     658 |
|         83 | Psychologist (billing independently)        |     549 |
|         84 | Addiction Medicine                          |     545 |
|         85 | Unknown Supplier/Provider                   |     346 |
|         86 | Mammographic Screening Center               |      76 |
|         87 | Slide Preparation Facility                  |      52 |
|         88 | Pharmacy                                    |      50 |
|         89 | Sleep Medicine                              |      16 |
+------------+---------------------------------------------+---------+
</pre>
