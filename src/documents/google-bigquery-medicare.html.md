---
title: "BigData processing using Google BigQuery and US Medicare data from 2012"
author: "StanGeorge"
created: "April 12, 2014"
edited: "April 13, 2014"
layout: "default"
isPage: true
preview: "Setup and process BigData using Google BigQuery. This post discusses uploading the data to Google CloudStorage and then loading them into BigQuery. After that we discuss how to run queries against them."
---
Centers for Medicare & Medicaid Services (CMS) released a [public data set](http://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Physician-and-Other-Supplier.html) with information on providers, services, procedures, costs etc. provided to Medicare beneficiaries in 2012. 
The [tab delimited](http://www.cms.gov/apps/ama/license-2011.asp?file=http://download.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Downloads/Medicare-Physician-and-Other-Supplier-PUF-CY2012.zip) file is 1.7GB uncompressed and contains over 9 million records. 
This is a fascinating trove of BigData that could be fun to examine. However, since its so large, its not trivial to do something with it in Excel or a traditional database. 
[Apache Hadoop](http://hadoop.apache.org/) comes to mind and we can also do MapReduce using [mrjob](https://pythonhosted.org/mrjob/) to process this data.
Another option is to simply upload this data to Google BigQuery and write queries on it. This post discusses how to do to this.

**Get the data**<br />
The entire compressed tab limited data can be downloaded [here](http://www.cms.gov/apps/ama/license-2011.asp?file=http://download.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Downloads/Medicare-Physician-and-Other-Supplier-PUF-CY2012.zip). 
I downloaded and uncompressed the file and named it medicare.txt. I wanted to start with a smaller data set, say 1000 rows. So I ran these commands in Linux.<pre>
head -n1002 medicare.txt > medicare-1002.txt *#Get the first 1002 lines from the file*

tail -n+3 medicare-1002.txt > medicare-1000.txt *#Skip the first 2 lines (header & copyright)*

gzip medicare-1000.txt *#Compress the file*
</pre>

Google BigQuery supports CSV and JSON data formats. The uncompressed file is around 197kB and I compressed the file to [medicare-1000.txt.gz](medicare-1000.txt.gz) (47kB). 
The <code>tail</code> command above can be skipped if you use the <code>configuration.load.skipLeadingRows</code> [option](https://developers.google.com/bigquery/docs/reference/v2/jobs#configuration.load.skipLeadingRows) in BigQuery. 

**Upload the data to Google CloudStorage**<br />
Google has release a command line tool [gsutil](https://developers.google.com/storage/docs/gsutil_install) to work with CloudStorage.<pre>
wget http://storage.googleapis.com/pub/gsutil.tar.gz *#Download gsutil*

tar xfz gsutil.tar.gz -C $HOME *#Install gsutil*

export PATH=${PATH}:$HOME/gsutil *#Add gsutil to PATH environment variable*

gsutil config *# Configure gsutil to set up credentials*
</pre>

Note that <code>gsutil config</code> above will provide a link that you will need to click. 
This will ask for your google login and provide you with an authentication code. 
You paste the code in the same command window where it asks you to *'Enter the authorization code:'*.
Create a new Google Project or use an existing one from [here](https://cloud.google.com/console#/project).
The next step is to provide your Google Project ID where it asks you *'What is your project-id?'*.
Once this is done, execute the following commands:<pre>
gsutil update *#Check for any updates*

gsutil mb gs://medicare *#Create a standard bucket in the US called 'medicare'*

gsutil cp medicare-1000.txt.gz gs://medicare/ *#Copy the file to the bucket*
</pre>

**Load the data from CloudStorage to Google BigQuery**<br />
Create a [schema.txt](schema.txt) file to be passed as a parameter to the <code>bq</code> command below. 
It looks something like this <pre>
[
{"type":"INTEGER","name":"npi"},
{"type":"STRING","name":"nppes_provider_last_org_name"},
{"type":"STRING","name":"nppes_provider_first_name"},
...
</pre>

You will need the [Google Cloud SDK](https://developers.google.com/cloud/sdk/) to use the [bq](https://developers.google.com/bigquery/bq-command-line-tool) command-line tool.<pre>
curl https://dl.google.com/dl/cloudsdk/release/install_google_cloud_sdk.bash | bash

gcloud auth login #This command will open a browser window to login to Google

bq mk medicare *#Create a new dataset. Load the data using the bq command below.*

bq load --field_delimiter='\t' --max_bad_records=99999999 medicare.medicare_2012 gs://medicare/medicare-1000.txt.gz schema.txt

gsutil rm gs://medicare/medicare-1000.txt.gz *#Remove the file from the bucket*
</pre>

**Write queries against BigQuery**<br />
Say you want to see the different type of providers who are not individuals. 
You also want to how many of each provider are there.
We can get the answer with this query<pre>
bq query "SELECT provider_type, COUNT(provider_type) as count FROM medicare.medicare_2012 WHERE nppes_entity_code!='I' GROUP BY provider_type order by count"
</pre>

This is the output that you will see:<pre>
+---------------------------------+-------+
|          provider_type          | count |
+---------------------------------+-------+
| Ambulance Service Supplier      |     6 |
| Ambulatory Surgical Center      |    13 |
| Mass Immunization Roster Biller |    17 |
+---------------------------------+-------+
</pre>

**Processing Times**<br />
When I used the all the data this is the time it took me: <pre>
time tail -n+3 medicare/medicare.txt > medicare/medicare-all.txt *#real 0m25.047s#
time gzip medicare/medicare-all.txt *#real 2m2.664s*
time gsutil cp medicare/medicare-all.txt.gz gs://medicare/ *#real 5m9.475s*
time bq rm -t medicare.medicare_2012 *#real 0m8.990s - Delete the existing table with 999 rows*
time bq load --field_delimiter='\t' --max_bad_records=99999999 medicare.medicare_2012 gs://medicare/medicare-1000.all.gz medicare/schema.txt *#real 7m21.388s*
</pre>

If you are interested in analysis of the entire Medicare 2012 data, please see [this post](medicare-2012-stats.html).

**References**
1. [Case study](https://developers.google.com/bigquery/case-studies/safari-books): How Safari Books Online uses BigQuery for Business Intelligence
2. Google post on [Preparing Data for BigQuery](https://developers.google.com/bigquery/preparing-data-for-bigquery)
3. Command Line Tool [gsutil](https://developers.google.com/storage/docs/gsutil) for Google CloudStorage
4. [Google Cloud SDK](https://developers.google.com/cloud/sdk/) to use the bq command-line tool
