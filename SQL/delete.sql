﻿use PARKING

SET STATISTICS IO ON;
SET STATISTICS TIME ON;


SET IDENTITY_INSERT  [dbo].[DS_NHANVIEN] ON

Delete from DS_NHANVIEN where TENNHANVIEN = 'Nguyễn Nam Thanh' OR 
TENNHANVIEN = 'Nguyễn Nam Thanh' OR 
TENNHANVIEN = 'Lê Ngọc Dũng' OR 
TENNHANVIEN = 'Vũ Chiêu Phong' OR 
TENNHANVIEN = 'Hoàng Công Phụng' OR 
TENNHANVIEN = 'Lương Duy Thắng' OR 
TENNHANVIEN = 'Đỗ Ðình Chương' OR 
TENNHANVIEN = 'Nguyễn Mạnh Chiến' OR 
TENNHANVIEN = 'Phạm Mạnh Hà' OR 
TENNHANVIEN = 'Lạc Ðạt Hòa' OR 
TENNHANVIEN = 'Đỗ Việt Khang' OR 
TENNHANVIEN = 'Vương Hoài Tín' OR 
TENNHANVIEN = 'Sái An Nguyên' OR 
TENNHANVIEN = 'Huỳnh Ðông Dương' OR 
TENNHANVIEN = 'Chu Quốc Vũ' OR 
TENNHANVIEN = 'Nguyễn Quốc Hoàng' OR 
TENNHANVIEN = 'Triệu Vĩnh Hưng' ;

SET STATISTICS TIME OFF;