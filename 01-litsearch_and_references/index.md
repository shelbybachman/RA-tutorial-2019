---
title       : literature search & reference management 
subtitle    : RA tutorial week 1, summer 2019
author      : shelby bachman
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
#hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

<style>
.title-slide {
  background-color: #bbbcce; /* #EDE0CF; ; #CA9F9D*/
}
strong {
  font-weight: bold;
}
em {
  font-style: italic
}
</style>

## Overview

week | topic
--------- |----------
**may 24** | **literature search & reference management**
may 31    | R part I: syntax, variables, & data types
jun 7     | R part II: data import & cleaning
jun 14    | R part III: data cleaning & organization
jun 21    | R part IV: basic plotting, stats, & R Markdown
jun 28    | how to read a scientific paper
jul 5     | MATLAB part I: syntax, variables, data types
jul 12    | MATLAB part II: data manipulation, scripts, & functions
jul 19    | MATLAB part III: building a basic experiment
jul 26    | no tutorial
aug 2     | MATLAB part IV: building a basic experiment (cont.)
aug 9     | data lab: working with real data in R
aug 16    | data lab: TBA

--- .class #id

## Conducting a literature search

- Choose a topic & scope
- Select keywords
- Search databases
- Identify relevant references
- Export results to a reference manager

--- .class #id 

## Choosing keywords

- Identify the core constructs of your topic
- For each construct, make a list of synonyms
- Useful tools for identifying related words:
  - https://www.ncbi.nlm.nih.gov/pubmed --> pull down `MeSH` in search bar
  - When reading an article, look for its keywords

*Example*: for the construct "emotion" we could choose the keywords **emotion**, **affect**, & **arousal**
  - MeSH search
  - View related papers on PubMed

--- .class #id 

## Search databases

**Choose the database(s) to query:**
- PubMed
  - Helpful feature: create an account to save your searches and collections of articles
- Google Scholar
  - Helpful features: "Cited by", "Find it @USC"
- PsycInfo
- Access more databases at https://libraries.usc.edu/ --> `Database Quicklinks`

**Use boolean operators to combine your keywords and query each database.**
- Generally, use the Advanced Search feature if it exists
- Use quotation marks around terms with multiple words
- Boolean operators: `AND`, `OR`, `NOT`

--- .class #id 

## Example literature search

Let's try a search on **emotion, memory and aging**, using the PubMed & PsycInfo databases.

Choose keywords: 

emotion | memory | aging
--- |--- | ---
affect | recall | "older adulthood"
arousal | recognition | "older adults"

<br>

Combine keywords with boolean operators:

`(emotion OR affect OR arousal)` AND `(memory OR recall OR recognition)` AND `(aging OR older adulthood)`

PubMed:https://www-ncbi-nlm-nih-gov.libproxy2.usc.edu/pubmed?otool=uscnmlib

PsycInfo: https://search-proquest-com.libproxy2.usc.edu/psycinfo?accountid=14749

--- .class #id 

## Managing search results

Depending on the scope of your search, you may have a large number of results. Some ways to filter through those results:
- Restrict to only articles published within the last `X` years
- Restrict the keyword search to look in "Title/Abstract" only

Regardless, you will need to review your results to identify which references are relevant. If you have a large number of results, my recommendation is to:
  - Start by reviewing titles and eliminating titles that are obviously irrelevant
  - After title review, review the abstract of each article
  - After identifying relevant abstracts, download relevant articles for full-text review

--- .class #id 

## Managing search results in PubMed

**Now, let's practice reviewing & downloading the results of our earlier search in PubMed.**

- In PubMed, there are two useful options for saving the results of a search.
- Once you have identified relevant articles to read, select them all using the checkbox feature.
- Then use the `Send to` feature, and choose one of the following options:
  - **Collections**: Here you can send results of a search to a "Collection" which stays saved on your PubMed account. *I use this feature often, particularly for searches with large sets of results that take me multiple days to filter through the results.*
  - **Citation manager**: Here you can export the results of your search as a `.nbib` file which can be read into a citation manager.

**Try exporting 5 results with the Citation manager option.**

--- .class #id

## Citation management tools

Citation management programs allow you to store and organize references, easily extract citations for references, and create bibliographies for collections of references. There are a number of citation management tools available, including:
- **Mendeley**
- Zotero
- RefWorks

The remainder of today's tutorial will focus on Mendeley.

--- .class #id 

## Getting started with Mendeley

- Register for an account: https://www.mendeley.com/
- Download Mendeley Desktop: https://www.mendeley.com/download-desktop/
  - This download includes the desktop reference manager as well as the Word plug-in
- Web Importer (on your own): https://www.mendeley.com/reference-management/web-importer/#id_2

--- .class #id 

## Setting up Mendeley Desktop on your computer

Set up a directory where Mendeley "watches" for new references:
- `Mendeley Desktop` --> `Preferences` --> `Watched Folders`
- I use a separate directory within my Downloads folder to store articles for reading and organization
- Download/place PDFs into this directory
- They will be added into the `Unsorted` section for subsequent organization

Set up how Mendeley automatically names and organizes references:
- `Mendeley Desktop` --> `File Organizer`
- Select `Organize my files` and choose the directory where they should be copied
- Set up how you would prefer articles to be named when they are copied by Mendeley

--- .class #id 

## Organizing references in Mendeley

Create folders and subfolders corresponding to projects, classes, etc.
<center>
![](images/organization.png?raw=true)
</center>

--- .class #id 

## Importing references to Mendeley

- From a search in PubMed, etc.
  - `File` --> `Import` --> `.bib` (or choose your format of choice)
  - `File` --> `Add Files` --> select PDF, etc.
- Using a PMID or doi identifier
  - `File` --> `Add Entry Manually` --> add PMID or doi identifier of desired reference
- Always check the `Details` of each reference you import, and update them as necessary

--- .class #id 

## Mendeley is also a great tool for reading articles

- Double click an article to read
- Use the `Notes` feature on the right panel to keep track of questions, etc.
- Use the `Note` feature on the top toolbar to add notes within the text
- Use the `Highlight` feature to highlight text or a rectangle within the text, in a color of your choice

--- .class #id 

## Exporting citations from Mendeley

- Choose a citation format
  - `View` --> `Citation Style` --> Choose your style of interest (often APA 6th et.)
- Export formatted citation(s):
  - higlight reference(s) of interest --> `CTRL` + click reference(s) --> `Copy As` --> Formatted Citation
  - paste the formatted citation(s) into word processor
- For writing papers, the Mendeley word plug-in is invaluable. Use it to add in-text citations and automatically generate a corresponding bibliography.

--- .class #id 

## Other potentially useful tools

- Share references in Mendeley using the "Groups" feature:
  - `Edit` --> `New Group` --> Create your group & add members
- Web import tool: useful if you are not using your personal machine
  - Add references and your local Mendeley Desktop will sync later
- Word citation plug-in

--- .class #id 

## Practice importing references to Mendeley Desktop

**Now, let's practice importing references using two methods.**

- First, add the references you saved earlier by importing the `.nbib` file into Mendeley
- Second, use your own method to import the following article:

**Mather & Sutherland. (2011). Arousal-Biased Competition in Perception and Memory. *Perspect Psychol Sci. 6*(2), 114-33. doi: 10.1177/1745691611400234.**

--- .class #id 

## Next week

Introduction to R: syntax, variables, & data types

*Please prepare for the next tutorial by installing R and R Studio:*

- To install R: https://cran.cnr.berkeley.edu/
- To install R Studio: https://www.rstudio.com/products/rstudio/download/#download

--- .class #id 









