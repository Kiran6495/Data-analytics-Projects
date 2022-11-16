select *
from PortfolioProject.dbo.Housing

--Sale date--


select SaleDate2, CONVERT(date,saledate)
from PortfolioProject.dbo.Housing

update Housing
SET SaleDate = CONVERT(date,saledate)

Alter Table Housing
Add saledate2 date;

update Housing
SET SaleDate2 = CONVERT(date,saledate)


--Property Address--

select PropertyAddress
from PortfolioProject.dbo.Housing
where PropertyAddress is null

select *
from PortfolioProject.dbo.Housing
Order by ParcelID

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress 
from PortfolioProject.dbo.Housing a
join PortfolioProject.dbo.Housing b
  on a.ParcelID = b.ParcelID
  and a.[UniqueID ] <> b.[UniqueID ]
  Where a.PropertyAddress is null

select a.ParcelID,a.PropertyAddress, b.ParcelID, b.PropertyAddress, Isnull (a.propertyAddress, b.propertyAddress)
from PortfolioProject.dbo.Housing a
join PortfolioProject.dbo.Housing b
  on a.ParcelID = b.ParcelID
  and a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

UPDATE a
SET PropertyAddress = Isnull (a.propertyAddress, b.propertyAddress)
from PortfolioProject.dbo.Housing a
join PortfolioProject.dbo.Housing b
  on a.ParcelID = b.ParcelID
  and a.[UniqueID ] <> b.[UniqueID ]

 --Breaking Down Address in (Address, City, State)--

select PropertyAddress
from PortfolioProject.dbo.Housing
--Order by ParcelID

Select
SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress)) as Address
from PortfolioProject.dbo.Housing


Alter Table Housing
Add PropertySplitAddress nvarchar(255);

update Housing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1)

Alter Table Housing
Add PropertySplitCity nvarchar(255);

update Housing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress))

Select *
from PortfolioProject.dbo.Housing

Select ownerAddress
from PortfolioProject.dbo.Housing

Select
PARSENAME(REPLACE(ownerAddress,',','.'),3)
,PARSENAME(REPLACE(ownerAddress,',','.'),2)
,PARSENAME(REPLACE(ownerAddress,',','.'),1)
from PortfolioProject.dbo.Housing

Alter Table Housing
Add OwnerSplitAddress nvarchar(255);

update Housing
SET OwnerSplitAddress = PARSENAME(REPLACE(ownerAddress,',','.'),3)


Alter Table Housing
Add OwnerSplitCity nvarchar(255);

update Housing
SET  OwnerSplitCity = PARSENAME(REPLACE(ownerAddress,',','.'),2)


Alter Table Housing
Add OwnerSplitstate nvarchar(255);

update Housing
SET OwnerSplitstate = PARSENAME(REPLACE(ownerAddress,',','.'),1)

Select *
from PortfolioProject.dbo.Housing

--Change Y and N to Yes and No "sold as vacant" field --

Select Distinct(SoldasVacant), COUNT(SoldasVacant)
from PortfolioProject.dbo.Housing
Group by SoldAsVacant
Order by 2

Select SoldAsVacant
, case when SoldAsVacant = 'Y' Then 'Yes'
       When SoldAsVacant = 'N' Then 'No'
	   Else SoldAsVacant
	   End
from PortfolioProject.dbo.Housing

Update Housing
Set SoldAsVacant = case when SoldAsVacant = 'Y' Then 'Yes'
       When SoldAsVacant = 'N' Then 'No'
	   Else SoldAsVacant
	   End

--Removing Duplicates--


WITH RowNumCTE AS(
Select *,
    ROW_NUMBER() Over(
	PARTITION by parcelID,
	             PropertyAddress,
				 SalePrice,
				 LegalReference
				 Order By 
				     UniqueID
				     ) row_num
from PortfolioProject.dbo.Housing
--Order by ParcelID
)
Select *
From RowNumCTE
Where row_num >1
--Order by PropertyAddress

