# Project Overview
## Kaggle's New York Stock Exchange S&P 500 dataset
### Introduction
In this project we will analyze real life data from the New York Stock Exchange. You will be drawing a subset of a large dataset provided by [Kaggle](https://www.kaggle.com/dgawlik/nyse) that contains historical financial data from S&P 500 companies. We have created a smaller subset of the data that you will be using for the project.
![](https://video.udacity-data.com/topher/2018/October/5bb67cdb_kaggle-nyse-page/kaggle-nyse-page.png)


# Understanding the Data
## Cleaning Up The Data
The original files from Kaggle's New York Stock Exchange S&P 500 page contain columns that are not relevant for this project. So we have provided a clean and curated the data set for this project. No further data cleaning is required from you.

Suggestions:
* Remove the first column without a header, which only has a sequential row count.
* Look for special characters present in some cell values
* Rename column headers by removing spaces and special characters, like commas. Depending on what you do with the data in the future having spaces or special characters in the column names may not work nicely.

## The following information is included in the Projectdata NYSE file:
* Ticker symbol: The company's symbol used for trading in the NYSE.
* Years: Year number of the 4 reporting periods.
* Period ending: Company's fiscal year end date.
* Total revenue: Annual revenue in dollars.
* Cost of goods sold: Annual cost of goods sold (COGS) in dollars.
* Sales, General, and Administrative expenses: Annual sales, general and administrative (SGA) expenses in dollars.
* Research and Development expenses: Annual research and development (R&D) expenses in dollars.
* Other Operating expense items: Annual other operating expenses in dollars.
* Global Industry Classification Standard (GICS) Sector: No changes
* GICS Sub Industry: No changes


# Project Details
## Introduction to the project
For the final project, you will conduct three Tasks:
1. Complete your own data analysis and create a presentation to share your findings.
2. Develop a Profit and Loss Statement dashboard.
3. Create a Financial Forecasting Model using three scenarios.

You should start by taking a look at your dataset and brainstorming which sub-category and company you want to focus your data analysis on - the questions leading to this page should have assisted in this process! TThen use a spreadsheet application like Excel or Google Sheets to conduct the analysis of the sub-category and company of your choice. This project is open-ended in that there is no one right answer.

## Planning ahead
Spending some time planning how to tackle this project will yield better outcomes. Begin by understanding and familiarizing yourself with the dataset, keeping the data analysis goal in mind from the outset. Execute the actual data analysis and communicate your findings. Below are some suggested pointers to help you plan ahead:
* Download the dataset (projectdata-nyse.csv) and spend some time understanding each column and how the data is organized.
* Remember, the objective of this project is to evaluate if the student can: a) Demonstrate how to calculate and interpret summary statistics. b) Construct a chart to properly communicate insights from data. c) Build data dashboards in a spreadsheet application.

Below are the detailed tasks required to complete the project:

## Task 1:
After familiarizing yourself with the data set, identify the question that you will answer based on your data analysis of summary statistics and include this in your slide presentation.
* Your question should include at least one categorical variable and one quantitative variable and require the use of at least one of the summary statistics.
* Create a tab within the spreadsheet file that includes the summary statistics. These are the measures of central tendency (mean, median) and the measures of spread (standard deviation and range) you used to answer your question.

## Task 2:
* Create a tab with a dashboard for a Profit and Loss (P&L) statement that calculates the Gross Profit, Operating Profit, or EBIT for a company.
* The dashboard must be dynamic, meaning that there should be a drop-down list for ticker symbol selection that includes all companies from the data set.
* Your P&L statement should be updated with the historical data for all the years of the selected company in the drop-down list.

## Task 3:
* Create a tab with a dashboard for a financial model for a company (different from Task 2) of your choice that forecasts out the Gross Profit, Operating Profit, or EBIT for two more years using three scenarios.
* The forecasting model should include a drop-down list for selecting a Strong case, a Base case, and a Weak case. Making the results of the forecast years dynamic.
* Your assumptions for revenue growth, gross margin, and operating margin should change for each scenario.
* This dashboard, however, can be static for the chosen ticker symbol (no drop-down list for the ticker symbol is required).

## Task 4:
* Download the submission template (PowerPoint or Google Slides); we suggest you use the layout provided, though it is not a requirement.
* Once you have finished analyzing the data, create your presentation in the provided template, sharing the visual and summary statistics insights.
* The summary information paragraph should clearly communicate your findings based on your analysis and provide visual or numeric values associated with your summary.
* The visualization(s) might be a bar chart, histogram, scatterplot, box plot, or other visual that you learned to make.