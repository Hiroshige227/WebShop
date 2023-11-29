-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2023-11-29 12:04:00
-- サーバのバージョン： 10.4.27-MariaDB
-- PHP のバージョン: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `bookdb`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `bkdatail`
--

CREATE TABLE `bkdatail` (
  `sno` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `bkorder`
--

CREATE TABLE `bkorder` (
  `oid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `oday` date NOT NULL,
  `dday` date DEFAULT NULL,
  `st` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `bkuser`
--

CREATE TABLE `bkuser` (
  `uid` int(11) NOT NULL,
  `uname` varchar(40) NOT NULL,
  `pas` varchar(12) NOT NULL,
  `adr` varchar(50) NOT NULL,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `bkuser`
--

INSERT INTO `bkuser` (`uid`, `uname`, `pas`, `adr`, `num`) VALUES
(1, 'root', '1234', 'abc@gmail.com', 1),
(2, 'user', '1234', 'akito-kouga@outlook.jp', 0),
(4, 'u', '1234', 'akito-kouga@outlook.jp', 0),
(5, 'u', '1234', 'akito-kouga@outlook.jp', 0),
(6, 'u', '1234', 'akito-kouga@outlook.jp', 0),
(7, 'u', '1234', 'akito-kouga@outlook.jp', 0),
(8, 'u', '1234', 'akito-kouga@outlook.jp', 0),
(9, 'u', '1234', 'akito-kouga@outlook.jp', 0),
(10, 'u', '1234', 'akito-kouga@outlook.jp', 0),
(11, 'u', '1234', 'akito-kouga@outlook.jp', 0),
(15, 'm', '1234', 'sfeh', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `book`
--

CREATE TABLE `book` (
  `bid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `cop` varchar(50) NOT NULL,
  `auth` varchar(40) NOT NULL,
  `price` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `book`
--

INSERT INTO `book` (`bid`, `title`, `cop`, `auth`, `price`, `num`) VALUES
(1, '窓際のトットちゃん', '講談社', '黒柳徹子', 900, 0),
(2, '道をひらく', 'PHP研究所', '松下幸之助', 950, 511),
(3, 'ハリーポッターと賢者の石', '静山社', 'J・K・ローリング', 2000, 509),
(4, '五体不満足', '講談社', '乙武 洋匡', 1500, 0),
(5, 'バカの壁', '新潮社', '養老 孟司', 900, 437),
(6, 'ハリーポッターと秘密の部屋', '‎静山社', 'J・K・ローリング', 2500, 433),
(7, '脳内革命', 'サンマーク出版', '春山茂雄', 1500, 410);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `bkdatail`
--
ALTER TABLE `bkdatail`
  ADD PRIMARY KEY (`sno`);

--
-- テーブルのインデックス `bkorder`
--
ALTER TABLE `bkorder`
  ADD PRIMARY KEY (`oid`);

--
-- テーブルのインデックス `bkuser`
--
ALTER TABLE `bkuser`
  ADD PRIMARY KEY (`uid`);

--
-- テーブルのインデックス `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bid`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `bkdatail`
--
ALTER TABLE `bkdatail`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `bkorder`
--
ALTER TABLE `bkorder`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `bkuser`
--
ALTER TABLE `bkuser`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- テーブルの AUTO_INCREMENT `book`
--
ALTER TABLE `book`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
