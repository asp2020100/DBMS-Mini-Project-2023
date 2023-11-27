<?php
require('fpdf/fpdf.php');
include('config.php');
session_start();
// Define the path to your logo image
$logo_path = 'assets/Trasparent_logo.png';

$month = $_GET['Month'];

$pdf = new FPDF();
$pdf->AddPage();

// Add the logo to the top right of the page
$pdf->Image($logo_path, $pdf->GetPageWidth() - 70, 5, 60);

// Define colors
$color_dark_gray = array(96, 96, 96);
$color_light_gray = array(220, 220, 220);
$color_white = array(255, 255, 255);
$color_black = array(0, 0, 0);
$color_blue = array(65, 105, 225);

// Create PDF object


// Set document properties
$pdf->SetAuthor('Diyaluma');
$pdf->SetTitle('Invoice');
$pdf->SetSubject('Invoice');
$pdf->SetKeywords('invoice, customer, diyaluma');

// Set font and text color
$pdf->SetFont('Arial', 'B', 14);
$pdf->SetTextColor($color_dark_gray[0], $color_dark_gray[1], $color_dark_gray[2]);

// Add page


// Company information
$pdf->Cell(0, 10, 'Diyaluma PVT. Ltd', 0, 1);
$pdf->SetFont('Arial', '', 10);
$pdf->SetTextColor($color_black[0], $color_black[1], $color_black[2]);
$pdf->Cell(0, 5, '"Diyaluma", Main St,', 0, 1);
$pdf->Cell(0, 5, 'Colombo 05, 00500', 0, 1);
$pdf->Cell(0, 5, 'Phone: (+94) 11 2 10 10 20', 0, 1);
$pdf->Cell(0, 5, 'Website: www.diyalumawatersuppliers.lk', 0, 1);
$pdf->Ln(10);

$query2="SELECT * FROM CUSTOMER WHERE Cus_ID='" . $_SESSION['user_2'] . "'";
$result2 = mysqli_query($mysqli, $query2);

while($row2 = mysqli_fetch_array($result2)){
  
    
    
    $pdf->Cell(0, 10, 'BILL TO : ', 0, 1);
	$pdf->SetFont('Arial', '', 10);
	$pdf->SetTextColor($color_black[0], $color_black[1], $color_black[2]);
	$pdf->Cell(0, 5, $row2['Fname'] . ' ' . $row2['Lname'], 0, 1);
	$pdf->Cell(0, 5, $row2['Cus_ID'], 0, 1);
	$pdf->Cell(0, 5, $row2['Address'], 0, 1);
	$pdf->Cell(0, 5, $row2['Phone'], 0, 1);
	$pdf->Ln(10);
}

$pdf->SetDrawColor($color_white[0],$color_white[1],$color_white[2]);

$pdf->Ln(10);

$query="SELECT * FROM PAYMENT_HISTORY WHERE Month='$month' AND Cus_ID = '" . $_SESSION['user_2'] . "'";
$result = mysqli_query($mysqli, $query);
$no=0;
while($row = mysqli_fetch_array($result)){
    
	// Invoice information
	$pdf->SetFont('Arial', 'B', 16);
	$pdf->SetFillColor($color_blue[0], $color_blue[1], $color_blue[2]);
	$pdf->SetTextColor($color_white[0], $color_white[1], $color_white[2]);
	$pdf->Cell(0, 15, 'INVOICE', 1, 1, 'C', true);
	$pdf->SetFont('Arial', 'B', 12);
	$pdf->SetFillColor($color_light_gray[0], $color_light_gray[1], $color_light_gray[2]);
	$pdf->SetTextColor($color_black[0], $color_black[1], $color_black[2]);
	$pdf->Cell(60, 10, 'Invoice Date:', 1, 0, 'L', true);
	$current_date = date('M j, Y'); 
	$pdf->Cell(0, 10, $current_date, 1, 1, 'L', true);
	$pdf->Cell(60, 10, 'Paid For the Month:', 1, 0, 'L', true);
	$pdf->Cell(0, 10, $row['Month'], 1, 1, 'L', true);
	$pdf->Cell(60, 10, 'Paid Amount Rs :', 1, 0, 'L', true);
	$pdf->Cell(0, 10, $row['Paid_Amount'], 1, 1, 'L', true);
	
	$date = DateTime::createFromFormat('Y-m', $row['Month']);
	$date->add(new DateInterval('P1M'));
	$new_month = $date->format('Y-m');

    $pdf->Cell(60, 10, 'Active until :', 1, 0, 'L', true);
	$pdf->Cell(0, 10, $new_month, 1, 1, 'L', true);
	$pdf->Ln(10);
}
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(0, 5, 'This is a computer generated invoice for your payment. No signature required.', 0, 1);
$pdf->Cell(0, 5, 'If there are problems, make a Complaint at Complaint portal. Your complaint will be checked soon.', 0, 1);
$pdf->Ln(5);
$pdf->Cell(0, 5, '-------------------------------------------------------------------------------------------------------------------------------------------------------------', 0, 1);

$pdf->Ln(5);
$pdf->Cell(0, 5, 'Payments for last 3 months : ', 0, 1);
$pdf->Ln(5);

$pdf->Cell(45,8,'Month',1);
$pdf->Cell(45,8,'Paid Date',1);
$pdf->Cell(45,8,'Amount',1);

$query="SELECT * FROM PAYMENT_HISTORY WHERE Cus_ID = '" . $_SESSION['user_2'] . "' ORDER BY Month DESC LIMIT 3 ;";
$result = mysqli_query($mysqli, $query);
$no=0;
while($row = mysqli_fetch_array($result)){
	

	$pdf->Ln(8);
	$pdf->SetFont('Arial','',12);
	$pdf->Cell(45,8,$row['Month'],1);
	$pdf->Cell(45,8,$row['Paid_Date'],1);
	$pdf->Cell(45,8,$row['Paid_Amount'],1);
	
}
$pdf->Ln(10);
$pdf->Cell(0, 5, '-----------------------------------------------------------------------------------------------------------------------------------', 0, 1);
$pdf->Ln(10);

$pdf->Ln(10);
$pdf->Cell(0, 5, 'Diyaluma Water Suppliers 2023 - Page 01 of 01 - Digital Invoice', 0, 1);
$pdf->Ln(10);

$pdf->Output();
?>
