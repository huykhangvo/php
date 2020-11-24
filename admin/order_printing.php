<!DOCTYPE html>
<html>
    <head>
        <title>ShopTKT</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../css/admin_style.css" >
        <script src="../resources/ckeditor/ckeditor.js"></script>
    </head>
    <body>
        <?php
        session_start();
        if (!empty($_SESSION['current_user'])) {
            include '../connect_db.php';
            $orders = mysqli_query($con, "SELECT orders.name, orders.address, orders.phone, orders.note, order_detail.*, product.name as product_name 
FROM orders
INNER JOIN order_detail ON Orders.id = order_detail.order_id
INNER JOIN product ON product.id = order_detail.product_id
WHERE orders.id = " . $_GET['id']);
            $orders = mysqli_fetch_all($orders, MYSQLI_ASSOC);
        }
        ?>
        <div id="order-detail-wrapper">
                <h1>HÓA ĐƠN BÁN HÀNG</h1>
                <center><h6>số 113 - đường Lê Thái Tổ, Phường 2, Thành Phố Vĩnh Long, Tỉnh Vĩnh Long, Việt Nam</h6></center>
                <label>Ngày Bán: 
                    <?php 
                        date_default_timezone_set("Asia/Ho_Chi_Minh");
                        echo date("d/m/yy H:i");    // MySQL datetime format
                           ?> 
                </span><br/>
                <label>Người nhận: </label><span> <?= $orders[0]['name'] ?></span><br/>
                <label>Địa chỉ: </label><span> <?= $orders[0]['address'] ?></span><br/>
                <label>Điện Thoại: </label><span> <?= $orders[0]['phone'] ?></span><br/>
                <hr/>
                <h3>Danh sách sản phẩm</h3>
                <ol>
                    <?php
                    $totalQuantity = 0;
                    $totalMoney = 0;
                    foreach ($orders as $row) {
                        ?>
                        <li>
                            <span class="item-name"><?= $row['product_name'] ?></span>
                            <span class="item-quantity">-Số Lượng SP: <?= $row['quantity'] ?> sản phẩm</span>
                        </li>
                        <?php
                        $totalMoney += ($row['price'] * $row['quantity']);
                        $totalQuantity += $row['quantity'];
                    }
                    ?>
               </ol> 
               <h7>Mã Giảm Giá: Đã Free Ship</h7>
               <center><h8>(Giá đã bao gồm thuế GTGT)</h8></center>
                <hr/>
                <center><h5>Chỉ xuất hóa đơn trong ngày</h5></center>
                <center><h6>Tax invoice will be issued within same day</h6></center>
                <hr/>
                <hr/>
                <center><h5>CẢM ƠN QUÝ KHÁCH VÀ HẸN GẶP LẠI</h5></center>
                <center><h5>Hotline: 0848741399 Website: huykhang.me</h5></center>
              
                <hr/>

                <label>Tổng SL:</label> <?= $totalQuantity ?> - <label>Tổng tiền phải thanh toán:</label> <?= number_format($totalMoney, 0, ",", ".") ?> đ
                <p><label>Ghi chú: </label><?= $orders[0]['note'] ?></p>
            </div>
        </div>
    </body>
</html>