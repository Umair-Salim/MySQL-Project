**<h1 style="text-align: left;">![image](mysql_project/1.jpg)</h1>**
**<h1 style="text-align: center;"> MySQL Data Cleaning Project</h1>**

## Overview
In this Portfolio Project, I cleaned the Nashville Housing Data in MySQL using Standard Query Language. I first create a database in mysql Workbench and then Imported the data using Workbench Import Wizard. I then Populated the Null values in PropertyAddress column. In some Places there were multiple entries of the same address, that helped us into populating the null values. I Joined the table with itself ON ParcelId column, and populated the null values where there was ParcelID same with the same address. Then I broke the PropertyAddress column into two individual columns namely Addressprop & CITY. Then it was time to substitute 'Y' to 'Yes' & 'N' to 'No' in SoldAsVacant Column. Finally I removed duplicate values and dropped useless columns.
