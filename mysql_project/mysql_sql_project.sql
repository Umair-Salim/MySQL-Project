/*
Cleaning Data in SQL Queries
*/

SELECT *
from portfolioproject.mytable;

-- Populate Properrty Adress Data
SELECT *
from portfolioproject.mytable
-- Where PropertyAddress is null
order by ParcelID;


SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, IFNULL(a.PropertyAddress,b.PropertyAddress) as address
from portfolioproject.mytable a
JOIN portfolioproject.mytable b
	ON a.ParcelID = b.ParcelID
    AND a.UniqueID <> b.UniqueID
where a.PropertyAddress is null;

Update 
portfolioproject.mytable a
JOIN portfolioproject.mytable b
	ON a.ParcelID = b.ParcelID
    AND a.UniqueID <> b.UniqueID
SET a.PropertyAddress = ifnull(a.PropertyAddress,b.PropertyAddress)
where a.PropertyAddress is null;

-- Breaking out Address into Individual columns(Address, City, State)

SELECT PropertyAddress
from portfolioproject.mytable;
-- Where PropertyAddress is null
-- order by ParcelID;

SELECT 
substring(PropertyAddress,1,locate(',',PropertyAddress)-1) as Address,
substring(PropertyAddress,locate(',',PropertyAddress)+1, length(PropertyAddress)) as Address
from portfolioproject.mytable;

alter table mytable
ADD Addressprop nvarchar(255);

UPDATE mytable
SET Addressprop = substring(PropertyAddress,1,locate(',',PropertyAddress)-1) ;

alter table mytable
ADD CITY nvarchar(255);

UPDATE mytable
SET CITY = substring(PropertyAddress,locate(',',PropertyAddress)+1, length(PropertyAddress));

SELECT *
from portfolioproject.mytable;


-- Change Y and N to Yes and No in Sold as Vacant

SELECT distinct(SoldAsVacant), count(SoldAsVacant)
FROM mytable
Group by SoldAsVacant
order by 2;

SELECT SoldAsVacant,
 CASE When SoldASVacant = 'Y' then 'Yes'
 WHEN SoldAsVacant = 'N' Then 'No'
 else SoldAsVacant
 END
FROM mytable;

UPDATE mytable
SET SoldAsVacant =  CASE When SoldASVacant = 'Y' then 'Yes'
 WHEN SoldAsVacant = 'N' Then 'No'
 else SoldAsVacant
 END;
 
-- Remove Duplicates

WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

From mytable
)
select *
From RowNumCTE
Where row_num > 1
Order by PropertyAddress;



Select *
From mytable;

-- DELETE unused Columns

Select *
From mytable;


alter Table mytable 
	DROP column TaxDistrict,
    DROP column PropertyAddress,
    DROP column SaleDate



