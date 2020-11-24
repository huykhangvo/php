-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 21, 2020 at 02:22 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `editweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `image_library`
--

CREATE TABLE `image_library` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `link` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `name`, `link`, `position`, `created_time`, `last_updated`) VALUES
(4, 0, 'Level 1', 'home2.php', 0, 1555232698, 1555232698),
(5, 4, 'Level 2', 'product.php', 1, 1555232976, 1555232976),
(6, 5, 'Level 3', 'product.php', 0, 1555232976, 1555232976),
(7, 6, 'Level 4', 'home.php', 0, 1555232976, 1555232976),
(8, 4, 'Level 2.2', 'product.php', 2, 1555232976, 1555232976),
(9, 8, 'Level 3.2', 'product.php', 1, 1555427808, 1555427808),
(10, 7, 'Level 5', 'home.php', 0, 1555427808, 1555427808),
(16, 0, 'Level 1.2', 'home2.php', 1, 1555232698, 1555232698),
(17, 10, 'Level 6', '#', 1, 1555542591, 1555542591),
(20, 17, 'Level 7', '#', 1, 1555542591, 1555542591),
(21, 16, 'Level 2.2.2', 'home2.php', 1, 1555232698, 1555232698);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `note` text NOT NULL,
  `total` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone`, `address`, `note`, `total`, `created_time`, `last_updated`) VALUES
(32, 'Andn', '6516156', 'Ha Noi', 'Testing', 4188000, 1592695048, 1592695048);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_time`, `last_updated`) VALUES
(28, 32, 4, 2, 780000, 1592695048, 1592695048),
(29, 32, 5, 4, 657000, 1592695048, 1592695048);

-- --------------------------------------------------------

--
-- Table structure for table `privilege`
--

CREATE TABLE `privilege` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url_match` varchar(255) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privilege`
--

INSERT INTO `privilege` (`id`, `group_id`, `name`, `url_match`, `created_time`, `last_updated`) VALUES
(1, 1, 'Danh sách sản phẩm', 'product_listing\\.php$', 1553185530, 1553185530),
(2, 1, 'Xóa sản phẩm', 'product_delete\\.php\\?id=\\d+$', 1553185530, 1553185530),
(3, 1, 'Sửa sản phẩm', 'product_editing\\.php\\?id=\\d+$|product_editing\\.php\\?action=edit&id=\\d+$', 1553185530, 1553185530),
(4, 1, 'Thêm sản phẩm', 'product_editing\\.php$|product_editing\\.php\\?action=add$', 1553185530, 1553185530),
(5, 1, 'Copy sản phẩm', 'product_editing\\.php\\?id=\\d+&task=copy', 1553185530, 1553185530),
(6, 4, 'Danh sách Danh mục', 'menu_listing\\.php$', 1553185530, 1553185530),
(7, 4, 'Xóa danh mục', 'menu_delete\\.php\\?id=\\d+$', 1553185530, 1553185530),
(8, 4, 'Sửa danh mục', 'menu_editing\\.php\\?id=\\d+$', 1553185530, 1553185530),
(9, 4, 'Thêm danh mục', 'menu_editing\\.php$', 1553185530, 1553185530),
(10, 4, 'Copy danh mục', 'menu_editing\\.php\\?id=\\d+&task=copy', 1553185530, 1553185530),
(11, 3, 'Danh sách đơn hàng', 'order_listing\\.php$', 1553185530, 1553185530),
(12, 2, 'Phân Quyền Quản Trị', 'member_privilege\\.php\\?id=\\d+$|member_privilege\\.php\\?action=save$', 1553185530, 1553185530),
(13, 2, 'Danh sách thành viên', 'member_listing\\.php$', 1553185530, 1553185530),
(14, 2, 'Xóa thành viên', 'member_delete\\.php\\?id=\\d+$', 1553185530, 1553185530),
(15, 2, 'Sửa thành viên', 'member_editing\\.php\\?id=\\d+$|member_editing\\.php\\?action=edit&id=\\d+$', 1553185530, 1553185530),
(16, 2, 'Thêm thành viên', 'member_editing\\.php$|member_editing\\.php\\?action=add$', 1553185530, 1553185530);

-- --------------------------------------------------------

--
-- Table structure for table `privilege_group`
--

CREATE TABLE `privilege_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `position` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privilege_group`
--

INSERT INTO `privilege_group` (`id`, `name`, `position`, `created_time`, `last_updated`) VALUES
(1, 'SẢN PHẨM', 2, 1553185530, 1553185530),
(2, 'THÀNH VIÊN', 4, 1553185530, 1553185530),
(3, 'ĐƠN HÀNG', 3, 1553185530, 1553185530),
(4, 'DANH MỤC', 1, 1553185530, 1553185530);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `content` text NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `content`, `created_time`, `last_updated`) VALUES
(2, 'GiÃ y bÃ³ng Ä‘Ã¡ 1', 'uploads/06-03-2019/shoes-1.jpg', 540000, 'GiÃ y bÃ³ng Ä‘Ã¡ 1 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(3, 'GiÃ y bÃ³ng Ä‘Ã¡ 2', 'uploads/06-03-2019/shoes-2.jpg', 1500000, 'GiÃ y bÃ³ng Ä‘Ã¡ 2 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(4, 'GiÃ y bÃ³ng Ä‘Ã¡ 3', 'uploads/06-03-2019/shoes-3.jpg', 780000, 'GiÃ y bÃ³ng Ä‘Ã¡ 3 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(5, 'GiÃ y bÃ³ng Ä‘Ã¡ 4', 'uploads/06-03-2019/shoes-4.jpg', 657000, 'GiÃ y bÃ³ng Ä‘Ã¡ 4 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(6, 'GiÃ y bÃ³ng Ä‘Ã¡ 5', 'uploads/06-03-2019/shoes-5.jpg', 684000, 'GiÃ y bÃ³ng Ä‘Ã¡ 5 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(7, 'Giày đá banh số  6', 'uploads/06-03-2019/shoes-6.jpg', 580000, '<p>Gi&Atilde;&nbsp;y b&Atilde;&sup3;ng &Auml;&lsquo;&Atilde;&iexcl; 6 s&Atilde;&cent;n c&aacute;&raquo; nh&Atilde;&cent;n t&aacute;&ordm;&iexcl;o</p>\r\n', 1552615987, 1605967318),
(8, 'Giày đá banh số  7', 'uploads/06-03-2019/shoes-7.jpg', 1320000, '<p>Gi&Atilde;&nbsp;y b&Atilde;&sup3;ng &Auml;&lsquo;&Atilde;&iexcl; 7 s&Atilde;&cent;n c&aacute;&raquo; nh&Atilde;&cent;n t&aacute;&ordm;&iexcl;o</p>\r\n', 1552615987, 1605967312),
(9, 'Giày đá banh số  8', 'uploads/06-03-2019/shoes-8.jpg', 1450000, '<p>Gi&Atilde;&nbsp;y b&Atilde;&sup3;ng &Auml;&lsquo;&Atilde;&iexcl; 8 s&Atilde;&cent;n c&aacute;&raquo; nh&Atilde;&cent;n t&aacute;&ordm;&iexcl;o</p>\r\n', 1552615987, 1605967306),
(10, 'Giày đá banh', 'uploads/06-03-2019/shoes-9.jpg', 1000000, '<p>Gi&agrave;y b&oacute;ng &Auml;&lsquo;&aacute; 9 s&acirc;n c&aacute;&raquo; nh&acirc;n t&aacute;&ordm;&iexcl;o</p>\r\n', 1552615987, 1605967299),
(11, 'Giày đá banh số  1', 'uploads/06-03-2019/shoes-1.jpg', 540000, '<p>Gi&Atilde;&nbsp;y b&Atilde;&sup3;ng &Auml;&lsquo;&Atilde;&iexcl; 1 s&Atilde;&cent;n c&aacute;&raquo; nh&Atilde;&cent;n t&aacute;&ordm;&iexcl;o</p>\r\n', 1552615987, 1605967289),
(12, 'Giày đá banh số  2', 'uploads/06-03-2019/shoes-2.jpg', 1500000, '<p>Gi&Atilde;&nbsp;y b&Atilde;&sup3;ng &Auml;&lsquo;&Atilde;&iexcl; 2 s&Atilde;&cent;n c&aacute;&raquo; nh&Atilde;&cent;n t&aacute;&ordm;&iexcl;o</p>\r\n', 1552615987, 1605967283),
(13, 'Giày đá banh số 3', 'uploads/06-03-2019/shoes-3.jpg', 780000, '<p>Gi&Atilde;&nbsp;y b&Atilde;&sup3;ng &Auml;&lsquo;&Atilde;&iexcl; 3 s&Atilde;&cent;n c&aacute;&raquo; nh&Atilde;&cent;n t&aacute;&ordm;&iexcl;o</p>\r\n', 1552615987, 1605967278),
(14, 'Giày đá banh số 4', 'uploads/06-03-2019/shoes-4.jpg', 657000, '<p>Gi&Atilde;&nbsp;y b&Atilde;&sup3;ng &Auml;&lsquo;&Atilde;&iexcl; 4 s&Atilde;&cent;n c&aacute;&raquo; nh&Atilde;&cent;n t&aacute;&ordm;&iexcl;o</p>\r\n', 1552615987, 1605967269),
(15, 'Giày đá banh số 5', 'uploads/06-03-2019/shoes-5.jpg', 684000, '<p>Gi&Atilde;&nbsp;y b&Atilde;&sup3;ng &Auml;&lsquo;&Atilde;&iexcl; 5 s&Atilde;&cent;n c&aacute;&raquo; nh&Atilde;&cent;n t&aacute;&ordm;&iexcl;o</p>\r\n', 1552615987, 1605967261),
(16, 'Giày đá banh số 6', 'uploads/06-03-2019/shoes-6.jpg', 580000, '<p>Gi&Atilde;&nbsp;y b&Atilde;&sup3;ng &Auml;&lsquo;&Atilde;&iexcl; 6 s&Atilde;&cent;n c&aacute;&raquo; nh&Atilde;&cent;n t&aacute;&ordm;&iexcl;o</p>\r\n', 1552615987, 1605967255);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `birthday` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `fullname`, `password`, `birthday`, `created_time`, `last_updated`) VALUES
(1, 'admin', 'Andn', '25d55ad283aa400af464c76d713c07ad', 1553185530, 1553185530, 1553185530),
(3, 'nv', 'VÕ HUY KHANG', '25d55ad283aa400af464c76d713c07ad', 1605967363, 1553185530, 1553185530);

-- --------------------------------------------------------

--
-- Table structure for table `user_privilege`
--

CREATE TABLE `user_privilege` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_privilege`
--

INSERT INTO `user_privilege` (`id`, `user_id`, `privilege_id`, `created_time`, `last_updated`) VALUES
(279, 1, 6, 1595430953, 1595430953),
(280, 1, 7, 1595430953, 1595430953),
(281, 1, 8, 1595430953, 1595430953),
(282, 1, 9, 1595430953, 1595430953),
(283, 1, 10, 1595430953, 1595430953),
(284, 1, 1, 1595430953, 1595430953),
(285, 1, 2, 1595430953, 1595430953),
(286, 1, 3, 1595430953, 1595430953),
(287, 1, 4, 1595430953, 1595430953),
(288, 1, 5, 1595430953, 1595430953),
(289, 1, 11, 1595430953, 1595430953),
(290, 1, 12, 1595430953, 1595430953),
(291, 1, 13, 1595430953, 1595430953),
(292, 1, 14, 1595430953, 1595430953),
(293, 1, 15, 1595430953, 1595430953),
(294, 1, 16, 1595430953, 1595430953),
(295, 3, 6, 1595430953, 1595430953),
(296, 3, 7, 1595430953, 1595430953),
(297, 3, 8, 1595430953, 1595430953),
(298, 3, 9, 1595430953, 1595430953),
(299, 3, 10, 1595430953, 1595430953),
(300, 3, 1, 1595430953, 1595430953),
(301, 3, 2, 1595430953, 1595430953),
(302, 3, 3, 1595430953, 1595430953),
(303, 3, 4, 1595430953, 1595430953),
(304, 3, 5, 1595430953, 1595430953),
(305, 3, 11, 1595430953, 1595430953),
(306, 3, 13, 1595430953, 1595430953),
(307, 3, 16, 1595430953, 1595430953);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `image_library`
--
ALTER TABLE `image_library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `privilege_group`
--
ALTER TABLE `privilege_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_privilege`
--
ALTER TABLE `user_privilege`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_privilege_ibfk_1` (`user_id`),
  ADD KEY `privilege_id` (`privilege_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `image_library`
--
ALTER TABLE `image_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `privilege`
--
ALTER TABLE `privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `privilege_group`
--
ALTER TABLE `privilege_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_privilege`
--
ALTER TABLE `user_privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `image_library`
--
ALTER TABLE `image_library`
  ADD CONSTRAINT `image_library_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `privilege`
--
ALTER TABLE `privilege`
  ADD CONSTRAINT `privilege_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `privilege_group` (`id`);

--
-- Constraints for table `user_privilege`
--
ALTER TABLE `user_privilege`
  ADD CONSTRAINT `user_privilege_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_privilege_ibfk_2` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
