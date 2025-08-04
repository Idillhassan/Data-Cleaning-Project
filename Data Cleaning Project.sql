select * from PortfolioProject..NashvilleHousing


select SaleDateconverted, CONVERT(date,saledate)
from PortfolioProject..NashvilleHousing



update NashvilleHousing
set SaleDate=CONVERT(date,saledate)

alter table NashvilleHousing
add saledateconverted date;

update NashvilleHousing
set SaleDateconverted=CONVERT(date,saledate)



select *
from PortfolioProject..NashvilleHousing
--where PropertyAddress is null
order by ParcelID



select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress,ISNULL(a.propertyaddress,b.PropertyAddress)
from PortfolioProject..NashvilleHousing a
join PortfolioProject..NashvilleHousing b
on a.ParcelID=b.ParcelID
and a.[UniqueID] <> b.[UniqueID]
where a.PropertyAddress is null



update a
set PropertyAddress=ISNULL(a.propertyaddress,b.PropertyAddress)
from PortfolioProject..NashvilleHousing a
join PortfolioProject..NashvilleHousing b
on a.ParcelID=b.ParcelID
and a.[UniqueID] <> b.[UniqueID]
where a.PropertyAddress is null



select PropertyAddress
from PortfolioProject..NashvilleHousing
--where PropertyAddress is null
--order by ParcelID



select
SUBSTRING(propertyaddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as address
,SUBSTRING(propertyaddress, CHARINDEX(',', PropertyAddress) +1 , len(PropertyAddress))  as address
from PortfolioProject..NashvilleHousing



alter table NashvilleHousing
add propertysplitaddress nvarchar(255);

update NashvilleHousing
set propertysplitaddress = SUBSTRING(propertyaddress, 1, CHARINDEX(',', PropertyAddress) -1 )

alter table NashvilleHousing
add propertysplitcity nvarchar(255);

update NashvilleHousing
set propertysplitcity = SUBSTRING(propertyaddress, CHARINDEX(',', PropertyAddress) +1 , len(PropertyAddress))



select * from
PortfolioProject..NashvilleHousing




select OwnerAddress
from PortfolioProject..NashvilleHousing



select
PARSENAME(replace(ownerAddress, ',', '.'),3)
,PARSENAME(replace(ownerAddress, ',', '.'),2)
,PARSENAME(replace(ownerAddress, ',', '.'),1)
from PortfolioProject..NashvilleHousing




alter table NashvilleHousing
add ownersplitaddress nvarchar(255);

update NashvilleHousing
set ownersplitaddress = PARSENAME(replace(ownerAddress, ',', '.'),3)

alter table NashvilleHousing
add ownersplitcity nvarchar(255);

update NashvilleHousing
set ownersplitcity = PARSENAME(replace(ownerAddress, ',', '.'),2) 

alter table NashvilleHousing
add ownersplitstate nvarchar(255);

update NashvilleHousing
set ownersplitstate = PARSENAME(replace(ownerAddress, ',', '.'),1) 



select * from
PortfolioProject..NashvilleHousing



select distinct(SoldAsVacant), count(soldasvacant)
from PortfolioProject..NashvilleHousing
group by SoldAsVacant
order by 2



select SoldAsVacant
,case when soldasvacant='Y' then 'Yes'
when soldasvacant='N' then 'No'
else SoldAsVacant
end 
from PortfolioProject..NashvilleHousing


update NashvilleHousing
set SoldAsVacant = case when soldasvacant='Y' then 'Yes'
when soldasvacant='N' then 'No'
else SoldAsVacant
end 



with rownumCTE as(
select *,
ROW_NUMBER() over(
partition by parcelid,
propertyaddress,
saleprice,
saledate,
legalreference
order by
uniqueid 
) row_num

from PortfolioProject..NashvilleHousing
--order by ParcelID
)
select * 
from rownumCTE
where row_num > 1
order by PropertyAddress




select*
from PortfolioProject..NashvilleHousing



alter table PortfolioProject..NashvilleHousing
drop column owneraddress,taxdistrict,propertyaddress


alter table PortfolioProject..NashvilleHousing
drop column saledate
