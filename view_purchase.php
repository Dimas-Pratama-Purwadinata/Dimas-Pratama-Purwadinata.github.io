<?php
include_once("init.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Pure Nature Shop - Data Pembelian</title>
    <link rel="stylesheet" href="css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <?php include_once("tpl/common_js.php"); ?>
    <script src="js/script.js"></script>
    <script src="js/view_purchase.js"></script>
	<script>
</script>
</head>
<body>
<?php include_once("tpl/top_bar.php"); ?>
<div id="header-with-tabs">
    <div class="page-full-width cf">
      <ul id="tabs" class="fl">
          <li><a href="dashboard.php" class="dashboard-tab">Dashboard</a></li>
          <li><a href="view_sales.php" class="sales-tab">Penjualan</a></li>
          <li><a href="view_customers.php" class=" customers-tab">Pelangggan</a></li>
          <li><a href="view_purchase.php" class="active-tab purchase-tab">Pembelian</a></li>
          <li><a href="view_supplier.php" class=" supplier-tab">Pemasok</a></li>
          <li><a href="view_product.php" class=" stock-tab">Produk</a></li>
          <li><a href="view_payments.php" class="payment-tab">Pembayaran</a></li>
          <li><a href="view_report.php" class="report-tab">Rekap Laporan</a></li>
      </ul>
      <a href="dashboard.php" id="company-branding-small" class="fr"><img src="images/s.png" alt=""></a>
    </div>
</div>
<div id="content">
    <div class="page-full-width cf">
        <div class="side-menu fl">
          <h3>Kelola Pengeluaran</h3>
          <ul>
              <li><a href="add_purchase.php">Tambah Pembelian</a></li>
              <li><a href="view_purchase.php">Lihat Pembelian</a></li>
          </ul>
        </div>
        <div class="side-content fr">
            <div class="content-module">
                <div class="content-module-heading cf">
                  <h3 class="fl">Data Pembelian</h3>
                </div>
                <div class="content-module-main cf">
                    <table>
                        <form action="" method="post" name="search">
                            <input name="searchtxt" type="text" class="round my_text_box" placeholder="Search">
                            &nbsp;&nbsp;<input name="Search" type="submit" class="my_button round blue   text-upper"
                                               value="cari">
                        </form>
                        <form action="" method="get" name="limit_go">
                            item yang ditampilkan<input name="limit" type="text" class="round my_text_box" id="search_limit"
                                                  style="margin-left:5px;"
                                                  value="<?php if (isset($_GET['limit'])) echo $_GET['limit']; else echo "10"; ?>"
                                                  size="3" maxlength="3">
                            <input name="go" type="button" value="pergi" class=" round blue my_button  text-upper"
                                   onclick="return confirmLimitSubmit()">
                        </form>

                        <form name="deletefiles" action="delete.php" method="post">

                            <input type="hidden" name="table" value="stock_entries">
                            <input type="hidden" name="return" value="view_purchase.php">
                            <input name="dsubmit" type="button" value="hapus item terpilih"
                                   class="my_button round blue   text-upper" style="margin-left:5px;"
                                   onclick="return confirmDeleteSubmit()"/>
                            <table>
                                <?php
                                $SQL = "SELECT DISTINCT(stock_id) FROM  stock_entries where type='entry'";

                                if (isset($_POST['Search']) AND trim($_POST['searchtxt']) != "") {
                                    $SQL = "SELECT DISTINCT(stock_id) FROM  stock_entries WHERE stock_name LIKE '%" . $_POST['searchtxt'] ."%' ORDER BY id DESC ";

                                }

                                $tbl_name = "stock_entries";
                                $adjacents = 3;
                                $query = "SELECT COUNT(DISTINCT stock_id) as num FROM $tbl_name where type='entry'";
                                if (isset($_POST['Search']) AND trim($_POST['searchtxt']) != "") {

                                    $query = "SELECT COUNT(DISTINCT stock_id) as num FROM stock_entries WHERE stock_name LIKE '%" . $_POST['searchtxt'] . "%' OR stock_supplier_name LIKE '%" . $_POST['searchtxt'] . "%' OR stock_id LIKE '%" . $_POST['searchtxt'] . "%' OR date LIKE '%" . $_POST['searchtxt'] . "%' OR type LIKE '%" . $_POST['searchtxt'] . "%' and type='entry'";


                                }
                                $total_pages = mysqli_fetch_array(mysqli_query($db->connection, $query));

                                $total_pages = $total_pages['num'];

                                $targetpage = "view_stock_entries.php";
                                $limit = 10;
                                if (isset($_GET['limit']))
                                    $limit = $_GET['limit'];

                                $page = isset($_GET['page']) ? $_GET['page'] : 0;

                                if ($page)

                                    $start = ($page - 1) * $limit;
                                else

                                    $start = 0;
                                $sql = "SELECT * FROM stock_entries ORDER BY id desc LIMIT $start, $limit  ";
                                if (isset($_POST['Search']) AND trim($_POST['searchtxt']) != "") {
                                    $sql = "SELECT * FROM stock_entries WHERE stock_name LIKE '%" . $_POST['searchtxt'] . "%'  ORDER BY id desc LIMIT $start, $limit";

                                }

                                $result = mysqli_query($db->connection, $sql);

                                if ($page == 0) $page = 1;
                                $prev = $page - 1;
                                $next = $page + 1;
                                $lastpage = ceil($total_pages / $limit);
                                $lpm1 = $lastpage - 1;
                                $pagination = "";

                                if ($lastpage > 1) {

                                    $pagination .= "<div >";

                                    if ($page > 1)

                                        $pagination .= "<a href=\"view_purchase.php?page=$prev&limit=$limit\" class=my_pagination >Previous</a>";

                                    else

                                        $pagination .= "<span class=my_pagination>Previous</span>";

                                    if ($lastpage < 7 + ($adjacents * 2))
                                    {

                                        for ($counter = 1; $counter <= $lastpage; $counter++) {

                                            if ($counter == $page)

                                                $pagination .= "<span class=my_pagination>$counter</span>";

                                            else

                                                $pagination .= "<a href=\"view_purchase.php?page=$counter&limit=$limit\" class=my_pagination>$counter</a>";

                                        }

                                    } elseif ($lastpage > 5 + ($adjacents * 2))
                                    {


                                        if ($page < 1 + ($adjacents * 2)) {

                                            for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++) {

                                                if ($counter == $page)

                                                    $pagination .= "<span class=my_pagination>$counter</span>";

                                                else

                                                    $pagination .= "<a href=\"view_purchase.php?page=$counter&limit=$limit\" class=my_pagination>$counter</a>";

                                            }

                                            $pagination .= "...";

                                            $pagination .= "<a href=\"view_purchase.php?page=$lpm1&limit=$limit\" class=my_pagination>$lpm1</a>";

                                            $pagination .= "<a href=\"view_purchase.php?page=$lastpage&limit=$limit\" class=my_pagination>$lastpage</a>";

                                        }
                                        elseif ($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2)) {

                                            $pagination .= "<a href=\"view_purchase.php?page=1&limit=$limit\" class=my_pagination>1</a>";

                                            $pagination .= "<a href=\"view_purchase.php?page=2&limit=$limit\" class=my_pagination>2</a>";

                                            $pagination .= "...";

                                            for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++) {

                                                if ($counter == $page)

                                                    $pagination .= "<span  class=my_pagination>$counter</span>";

                                                else

                                                    $pagination .= "<a href=\"view_purchase.php?page=$counter&limit=$limit\" class=my_pagination>$counter</a>";

                                            }

                                            $pagination .= "...";

                                            $pagination .= "<a href=\"view_purchase.php?page=$lpm1&limit=$limit\" class=my_pagination>$lpm1</a>";

                                            $pagination .= "<a href=\"view_purchase.php?page=$lastpage&limit=$limit\" class=my_pagination>$lastpage</a>";

                                        }

                                        else {

                                            $pagination .= "<a href=\"$view_purchase.php?page=1&limit=$limit\" class=my_pagination>1</a>";

                                            $pagination .= "<a href=\"$view_purchase.php?page=2&limit=$limit\" class=my_pagination>2</a>";

                                            $pagination .= "...";

                                            for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++) {

                                                if ($counter == $page)

                                                    $pagination .= "<span class=my_pagination >$counter</span>";

                                                else

                                                    $pagination .= "<a href=\"$targetpage?page=$counter&limit=$limit\" class=my_pagination>$counter</a>";

                                            }

                                        }

                                    }

                                    if ($page < $counter - 1)

                                        $pagination .= "<a href=\"view_purchase.php?page=$next&limit=$limit\" class=my_pagination>Next</a>";

                                    else

                                        $pagination .= "<span class= my_pagination >Next</span>";

                                    $pagination .= "</div>\n";

                                }

                                ?>
                                <tr>
                                    <th>No</th>
                                    <th>Id Pembelian</th>
                                    <th>Nama Produk</th>
                                    <th>Tanggal</th>
                                    <th>Pemasok</th>
                                    <th>Jumlah</th>
                                    <th>Edit / hapus</th>
                                    <th>Pilih</th>


                                </tr>

                                <?php $i = 1;
                                $no = $page - 1;
                                $no = $no * $limit;
								$co=0;
								$co1=0;
								$s=mysqli_query($db->connection, "select * from stock_entries");
								while($r= mysqli_fetch_array($s))
								{
									$co++;
								}


                                while ($row = mysqli_fetch_array($result)) {
    								   $co1++;
                                    ?>
                                    <tr id='tr<?php echo $row['id']; ?>'>
                                        <td> <?php echo $no + $i; ?></td>
                                        <td><?php echo $row['stock_id']; ?></td>
                                       <td><?php echo $row['stock_name']; ?></td>
                                       <td><?php echo $row['date']; ?></td>
                                       <td><?php echo $row['stock_supplier_name']; ?></td>
                                       <td><?php echo $row['subtotal']; ?></td>
                                        <td>
                                            <a href="update_purchase.php?sid=<?php echo $row['id']; ?>&table=stock_entries&return=view_purchase.php"
                                               class="table-actions-button ic-table-edit">
                                            </a>
                                            <a onclick="return confirmSubmit()"
                                               href="delete.php?id=<?php echo $row['id']; ?>&table=stock_entries&return=view_purchase.php"
                                               class="table-actions-button ic-table-delete"></a>
                                        </td>
                                        <td><input type="checkbox"
                                                   value="<?php echo isset($row['id']) ? $row['id'] : 0; ?>"
                                                   name="checklist[]" id="<?php echo $row['id']; ?>"/></td>

                                    </tr>
                                    <?php $i++;
                                } ?>
                                <tr>
                                <table>

                                </table>
                            </table>
                        </form>
                </div>
            </div>
	<?php include_once("tpl/footer.php"); ?>
</body>
</html>
