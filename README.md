# Data Cleaning SQL Project: Nashville Housing Data

## Project Overview

This project focuses on the end-to-end process of cleaning and transforming a raw, messy dataset. The goal was to take a messy, unstandardized dataset and use SQL to make it usable for further analysis and reporting.

## Dataset

* Raw Dataset: Nashville Housing Data.

## Skills Demonstrated

This project showcases a strong understanding of essential data cleaning and transformation techniques using SQL, including:

- Data Type Conversion: Converting data to the correct format for analysis.
- Handling Missing Data: Using self-joins to intelligently populate missing values.
- Data Splitting: Breaking down single columns (like addresses) into multiple, usable columns.
- Data Standardization: Using CASE statements to standardize categorical data.
- Removing Duplicates: Using advanced techniques like CTEs and window functions to identify and remove duplicate records.
- Schema Modification: Adding and dropping columns to create a clean, final table.

## Key Cleaning Steps Taken

The following steps were performed using the SQL queries provided in this repository:

1.  Standardized Sale Date Format: Converted the SaleDate column from a datetime format to a standard date format.
2.  Populated Missing Property Addresses: Used a self-join to fill in missing property addresses by referencing other records with the same ParcelID.
3.  Split Address Columns: Separated the PropertyAddress and OwnerAddress columns into individual columns for street, city, and state, making the data more granular and useful.
4.  Standardized "Sold as Vacant" Field: Corrected inconsistencies in the SoldAsVacant column by changing 'Y' and 'N' values to 'Yes' and 'No' for clarity.
5.  Removed Duplicate Rows: Identified and removed duplicate records in the dataset using a window function with a CTE to ensure data integrity.
6.  Removed Unused Columns: Dropped the original, uncleaned columns from the final table to create a tidy dataset ready for use.

## Tools Used

* SQL: The primary tool used for all data cleaning and transformation steps.

## Conclusion

This project successfully demonstrates the critical skill of preparing data for analysis. The final cleaned dataset is now reliable and ready for further exploration and visualization.
