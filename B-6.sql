-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2026-01-02 18:13:10
-- 伺服器版本： 8.0.44
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `mybase`
--

-- --------------------------------------------------------

--
-- 資料表結構 `admin`
--

CREATE TABLE `admin` (
  `admin_id` int NOT NULL,
  `role` enum('高階','普通') COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `admin`
--

INSERT INTO `admin` (`admin_id`, `role`, `username`, `password`) VALUES
(1, '高階', 'admin', 'admin1234'),
(3, '普通', '413007062', '413007062');

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `cart_id` int UNSIGNED NOT NULL,
  `member_id` int NOT NULL,
  `cart_time` datetime NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `cart`
--

INSERT INTO `cart` (`cart_id`, `member_id`, `cart_time`, `total_price`) VALUES
(8, 2, '2025-12-23 00:13:56', 499.00),
(9, 2, '2025-12-23 00:31:15', 499.00),
(10, 2, '2025-12-23 00:32:04', 499.00),
(11, 2, '2025-12-23 00:34:58', 499.00);

-- --------------------------------------------------------

--
-- 資料表結構 `cart_detail`
--

CREATE TABLE `cart_detail` (
  `cart_detail_id` int NOT NULL,
  `cart_id` int UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `mult_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `member_id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `state` enum('有效','禁止') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`member_id`, `username`, `password`, `name`, `phone_num`, `email`, `address`, `birthday`, `state`) VALUES
(1, 'test01', '123456', '惟昭', '921692839', 's36238608@gmail.com', '華齡街17巷6號2樓', '2003-05-08', '有效'),
(2, 'QQQ', '123456789', 'QQQ', '123456789', '412007154@o365.tku.edu.tw', '123456789', '2025-12-25', '有效'),
(3, '413007062', '413007062', '鄧凱謙', '0974114642', '', '', '0000-00-00', '有效'),
(4, '4130070621', '123456', '鄧凱謙', '974114643', '413007062@gmail.com', '', '0000-00-00', '有效'),
(5, '456', '456', '123', '123', '123@gmail.com', '123', '2025-12-30', '禁止');

-- --------------------------------------------------------

--
-- 資料表結構 `order`
--

CREATE TABLE `order` (
  `order_id` int NOT NULL,
  `member_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `delivery_method` enum('宅配到府','便利商店取貨') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('信用卡支付','貨到付款') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('未付款','處理中','訂單完成','已取消','退貨中','已退貨') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '未付款'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `mult_price` decimal(10,2) DEFAULT NULL,
  `order_price` decimal(10,2) DEFAULT NULL,
  `freight_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `album_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `artist_group` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `style` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` enum('預購','現貨','缺貨') COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` longblob NOT NULL,
  `is_hot` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`product_id`, `album_name`, `artist_group`, `style`, `price`, `stock`, `category`, `tags`, `description`, `state`, `product_image`, `is_hot`) VALUES
(1, 'HELP EVER HURT NEVER', '藤井 風', '黑膠唱片', 1280.00, 15, '黑膠唱片', 'HELP EVER HURT NEVER, 藤井 風, 黑膠唱片, J-POP, 日本流行', '藤井風首張個人專輯黑膠化。收錄全球爆紅單曲《死ぬのがいいわ》，以其獨特的爵士與 R&B 融合曲風，奠定了他在日本樂壇的不可撼動地位。', '現貨', 0x75706c6f6164732f313736373132393839385f312e706e67, 0),
(2, 'Nicolo Paganini: Sonata a Preghiera', '帕格尼尼', 'CD', 549.00, 45, '專輯', 'Nicolo Paganini: Sonata a Preghiera, 帕格尼尼, CD, 專輯, 古典音樂, 小提琴', '盧卡．方馮尼 Luca Fanfoni - violin soloist 卡羅．坎蒂尼 Carlo Cantini – violin 丹尼．方馮尼 Daniele Fanfoni - violin 薩維裡奧．佛利亞羅 Saverio Fogliaro - guitar 皇家協奏團 Reale Concerto 帕爾馬音樂家樂團 I Musici di Parma Orchestra 安東尼奧．德．洛倫齊 Antonio De Lorenzi - conductor\r\n本專輯收錄多首帕格尼尼精心重建及未發表的作品。但最受矚目的莫過於《祈禱奏鳴曲》，這是首次以原譜管弦樂編制完整呈現。\r\n帕格尼尼（Niccolo Paganini，1782-1840）生前為了保護他獨步天下的演奏技巧，極少公開出版自己的音樂作品。直到逝世十年後，樂譜才陸續問世，但也因此造成版本混亂，為後世研究增添了難度。1816年，三十四歲的帕格尼尼與二十四歲的歌劇作曲家羅西尼在羅馬相遇，此後帕格尼尼便以羅西尼的歌劇為靈感創作了數首變奏曲。《祈禱奏鳴曲》創作於1819年，首次演出在1827年7月。很可惜的是，在義大利羅馬的一個圖書館裡，收藏了很多帕格尼尼親手寫的樂譜，但《祈禱奏鳴曲》的小提琴獨奏部分和總譜的親筆手稿遺失了。只剩下管弦樂部分的樂譜，以致後來的版本都是改編的。\r\n著名的《摩西幻想曲》選自《祈禱奏鳴曲》中的Maestoso、Recitativo和Allegro molto三個樂章，遺憾地缺少了序奏（Introduction），1855年時由德國漢堡的舒伯特出版商（Schuberth & Co）發行了一個標題為「以羅西尼歌劇《摩西》為主題的華麗變奏曲，是為小提琴而作，可選鋼琴或四重奏伴奏」的版本，改編自羅西尼歌劇《摩西在埃及》（Mosè in Egitto）中的咏嘆調〈你那星光閃耀的寶座〉，而這個不完整版本的《祈禱奏鳴曲》竟成為流傳最廣的版本。幸運的是，在許多音樂學者的努力研究下，音樂學家伊塔洛．韋斯科沃（Italo Vescovo），將所有的資料匯整重建這首曲子，讓這首《祈禱奏鳴曲》得以完整的呈現，此外，專輯中還收錄了多首珍貴稀有的曲目及全球首次錄音曲目。', '現貨', 0x75706c6f6164732f313736373132393930375f322e706e67, 0),
(3, 'LOST CORNER', '米津玄師', 'CD', 2580.00, 5, '專輯', 'LOST CORNER, 米津玄師, CD, 專輯, J-POP, 影劇配樂', '米津玄師 2024 年全新大碟。收錄包含電影《蒼鷺與少年》主題曲《地球儀》、影集《Last Mile》主題曲《がらくた》等多首極具實驗性與商業價值的頂尖之作。', '現貨', 0x75706c6f6164732f313736373132393934365f332e706e67, 0),
(4, 'GENE', 'a子', 'CD', 839.00, 10, '專輯', 'GENE, a子, CD, 專輯, 日本音樂, 迷幻流行', '日本新世代創作女歌手 a子 首張主流出道專輯。以獨特的迷幻唱腔與洗練的城市流行感，被譽為當今日本樂壇最受矚目的新星之一。', '現貨', 0x75706c6f6164732f313736373132393935345f342e706e67, 0),
(5, 'LOVE ALL SERVE ALL', '藤井 風', '台壓盤', 448.00, 8, '專輯', 'LOVE ALL SERVE ALL, 藤井 風, 台壓盤, 專輯, J-POP, 流行', '藤井風第二張大碟，專輯名稱傳遞了宏大的愛與奉獻精神。收錄熱門單曲《きらり》、《燃えよ》，展現了他更為成熟的編曲與旋律掌控能力。', '現貨', 0x75706c6f6164732f313736373132393936325f352e706e67, 0),
(6, 'AP232《艾弗瑞》鋼琴表演(3)', '《艾弗瑞》', '彩色書', 140.00, 10, '樂譜', 'AP232《艾弗瑞》鋼琴表演(3), 《艾弗瑞》, 彩色書, 樂譜', '本書可與第三級「鋼琴教本」及「鋼琴理論」結合使用。鋼琴表演的使用作為在「鋼琴教本」介紹的每一新概念和理論提供複習和加強性效果；由於本書中的樂曲不僅有指導作用，還富有興趣與娛樂性，它們的使用加大大地增加學生的學習樂趣，正如本書名稱所示，其中樂曲特別適合用於公開演出。', '現貨', 0x75706c6f6164732f313736373132393937325f362e706e67, 0),
(7, 'Get Up [2nd EP] Bunny Beach Bag ver.', 'NewJeans', 'CD', 650.00, 25, '專輯', 'Get Up [2nd EP] Bunny Beach Bag ver., NewJeans, CD, 專輯, Get Up, K-POP, 潮流', 'NewJeans 第二張迷你專輯，內含海灘袋造型外盒、寫真書及小卡組，視覺設計由藝術總監閔熙珍親自操刀。', '現貨', 0x75706c6f6164732f313736373132393938345f372e706e67, 1),
(8, '最偉大的作品 (珍藏版)', '周杰倫', 'CD', 580.00, 12, '專輯', '最偉大的作品 (珍藏版), 周杰倫, CD, 專輯, 最偉大的作品, 華語流行, 經典', '周杰倫時隔六年的個人專輯，同名主打歌融合古典鋼琴與流行饒舌，向馬格利特、達利等藝術家致敬。', '現貨', 0x75706c6f6164732f313736373133303030385f382e706e67, 1),
(9, 'Midnights (Moonstone Blue Edition)', 'Taylor Swift', '黑膠唱片', 1380.00, 8, '黑膠唱片', 'Midnights (Moonstone Blue Edition), Taylor Swift, 黑膠唱片, Midnights, 流行, 歐美', '泰勒絲第十張錄音室專輯，收錄《Anti-Hero》等熱門單曲。此版本為月光藍限量色膠，極具收藏價值。', '預購', 0x75706c6f6164732f313736373133303032305f392e706e67, 1),
(10, 'First Love (15th Anniversary Edition)', '宇多田光', '黑膠唱片', 1680.00, 5, '黑膠唱片', 'First Love (15th Anniversary Edition), 宇多田光, 黑膠唱片, First Love, J-POP, 經典', '日劇《First Love 初戀》帶動全球熱潮，宇多田光經典首張專輯重製版黑膠，音質溫潤飽滿。', '現貨', 0x75706c6f6164732f313736373133303033305f31302e706e67, 0),
(11, 'Happier Than Ever (Peach Cassette)', 'Billie Eilish', '錄音帶', 450.00, 15, '錄音帶', 'Happier Than Ever (Peach Cassette), Billie Eilish, 錄音帶, Happier Than Ever, 怪奇比莉, 歐美', '怪奇比莉第二張專輯復古卡帶版。蜜桃色外殼設計，深受年輕收藏家喜愛。', '現貨', 0x75706c6f6164732f313736373133303534335f31312e706e67, 0),
(12, 'Guardians of the Galaxy: Awesome Mix Vol. 1', 'Various Artists', '錄音帶', 390.00, 20, '錄音帶', 'Guardians of the Galaxy: Awesome Mix Vol. 1, Various Artists, 錄音帶, Awesome Mix Vol. 1, 銀河守護隊, 電影原聲帶, 復古', '電影《星際異攻隊》劇中靈魂物件「勁爆舞曲大帝國第一輯」官方復刻卡帶。', '現貨', 0x75706c6f6164732f313736373133303535335f31322e706e67, 0),
(13, '久石讓：鋼琴故事 Best 鋼琴譜', '久石讓', '樂譜', 480.00, 30, '樂譜', '久石讓：鋼琴故事 Best 鋼琴譜, 久石讓, 樂譜, Piano Stories Best, 宮崎駿, 鋼琴', '收錄《神隱少女》、《龍貓》等經典動畫配樂鋼琴獨奏譜，適合中級以上程度。', '現貨', 0x75706c6f6164732f313736373133303538305f31332e706e67, 0),
(14, '周杰倫 10年經典鋼琴彈唱譜', '周杰倫', '樂譜', 350.00, 15, '樂譜', '周杰倫 10年經典鋼琴彈唱譜, 周杰倫, 樂譜, 華語流行, 彈唱', '精選周杰倫出道十年前期最經典的 25 首歌曲，含簡譜與五線譜對照。', '現貨', 0x75706c6f6164732f313736373133303538395f31342e706e67, 0),
(15, 'BLACKPINK Official Lightstick Ver.2', 'BLACKPINK', '周邊', 1850.00, 40, '周邊', 'BLACKPINK Official Lightstick Ver.2, BLACKPINK, 周邊, BLACKPINK Official Lightstick, 應援棒, 粉墨', 'BLACKPINK 官方二代應援螢光棒，具備藍牙連線與音樂連動燈光效果。', '現貨', 0x75706c6f6164732f313736373133303539395f31352e706e67, 0),
(16, 'HELP EVER HURT NEVER T-Shirt (Black)', '藤井 風', '周邊', 1200.00, 10, '周邊', 'HELP EVER HURT NEVER T-Shirt (Black), 藤井 風, 周邊, HELP EVER HURT NEVER, T-Shirt, 日本藝人', '藤井風首張專輯紀念 T-Shirt，簡約黑色設計搭配精緻刺繡字樣。', '缺貨', 0x75706c6f6164732f313736373133303630395f31362e706e67, 0),
(17, 'Marshall Emberton II 藍牙喇叭', 'Marshall', '奶油白', 5890.00, 5, '其他', 'Marshall Emberton II 藍牙喇叭, Marshall, 奶油白, 其他, Emberton II, 音響, 藍牙喇叭', 'Marshall 最受歡迎的攜帶式喇叭，具備 30 小時續航力與經典搖滾外觀。全向式音效讓你無論在任何角度都能享受純淨音樂。', '現貨', 0x75706c6f6164732f313736373133303632305f31372e706e67, 1),
(18, 'iTunes / Apple Gift Card 1000元面額', 'Apple', '數位點數', 1000.00, 100, '其他', 'iTunes / Apple Gift Card 1000元面額, Apple, 數位點數, 其他, iTunes Gift Card, 儲值, 數位音樂', '可用於 App Store 以及 Apple Music 訂閱，是送給愛樂者最實用的禮物。', '現貨', 0x75706c6f6164732f313736373133303633355f31382e706e67, 0),
(19, '25', 'Adele', 'CD', 488.00, 15, '專輯', '25, Adele, CD, 專輯, 歐美流行, 靈魂樂', '愛黛兒打破全球銷售紀錄的經典專輯，收錄橫掃榜單的神曲《Hello》以及《When We Were Young》。', '現貨', 0x75706c6f6164732f313736373133303634355f31392e706e67, 0),
(20, '坂本龍一：Opus 鋼琴作品集', '坂本龍一', '精裝書', 850.00, 20, '樂譜', '坂本龍一：Opus 鋼琴作品集, 坂本龍一, 精裝書, 樂譜, Opus, 古典, 電影配樂', '收錄教授晚年最後演奏錄音專輯《Opus》中的所有曲目，包含《Merry Christmas Mr. Lawrence》與《The Last Emperor》。', '現貨', 0x75706c6f6164732f313736373133303635395f32302e706e67, 1),
(21, '醜奴兒 (限量復刻卡帶版)', '草東沒有派對', '錄音帶', 420.00, 3, '錄音帶', '醜奴兒 (限量復刻卡帶版), 草東沒有派對, 錄音帶, 醜奴兒, 獨立搖滾, 台灣', '第 28 屆金曲獎最佳新人與最佳樂團獲獎作品，台灣獨立音樂劃時代之作，限量卡帶極具收藏價值。', '缺貨', 0x75706c6f6164732f313736373133313232325f32312e706e67, 1),
(22, 'Positions (Deluxe Edition Vinyl)', 'Ariana Grande', '黑膠唱片', 1450.00, 10, '黑膠唱片', 'Positions (Deluxe Edition Vinyl), Ariana Grande, 黑膠唱片, Positions, 亞莉安娜, R&B', '亞莉安娜第六張錄音室專輯，豪華版雙黑膠收錄包含《34+35》等多首加收曲目。', '現貨', 0x75706c6f6164732f313736373133313233335f32322e706e67, 0),
(23, 'THE WORLD EP.FIN : WILL', 'ATEEZ', 'CD', 620.00, 30, '專輯', 'THE WORLD EP.FIN : WILL, ATEEZ, CD, 專輯, K-POP, 唱跳', 'ATEEZ 2024 全新正規專輯，展現強烈世界觀與極致舞台魅力。', '現貨', 0x75706c6f6164732f313736373133313234385f32332e706e67, 0),
(24, 'THE BOOK', 'YOASOBI', '限量索引版', 1280.00, 5, '專輯', 'THE BOOK, YOASOBI, 限量索引版, 專輯, J-POP, 小說音樂化', '日本雙人組合 YOASOBI 首張 EP，收錄現象級神曲《夜に駆ける》。', '現貨', 0x75706c6f6164732f313736373133313235385f32342e706e67, 1),
(25, 'Ugly Beauty', '蔡依林', '正式版', 520.00, 15, '專輯', 'Ugly Beauty, 蔡依林, 正式版, 專輯, 華語流行, 舞曲', 'Jolin 睽違多年重磅回歸之作，探討人性內心陰暗面與美醜定義。', '現貨', 0x75706c6f6164732f313736373133313238375f32352e706e67, 0),
(26, 'Music of the Spheres', 'Coldplay', 'CD', 450.00, 20, '專輯', 'Music of the Spheres, Coldplay, CD, 專輯, 搖滾, 英國', '酷玩樂團太空主題專輯，收錄與 BTS 合作的《My Universe》。', '現貨', 0x75706c6f6164732f313736373133313330315f32362e706e67, 0),
(27, 'SOS', 'SZA', 'CD', 490.00, 10, '專輯', 'SOS, SZA, CD, 專輯, R&B, 歐美', 'SZA 橫掃葛萊美之作，定義當代 R&B 靈魂新高度。', '現貨', 0x75706c6f6164732f313736373133313331335f32372e706e67, 0),
(28, '1989 (Taylor\'s Version)', 'Taylor Swift', 'Sunrise Boulevard Yellow', 550.00, 18, '專輯', '1989 (Taylor\'s Version), Taylor Swift, Sunrise Boulevard Yellow, 專輯, CD, 流行, 重製', '泰勒絲經典專輯重製版，收錄全新「從保險箱取出」加收曲目。', '現貨', 0x75706c6f6164732f313736373133313332345f32382e504e47, 0),
(29, 'IVE SWITCH', 'IVE', 'ON ver.', 600.00, 25, '專輯', 'IVE SWITCH, IVE, ON ver., 專輯, K-POP, 女團', 'IVE 全新迷你專輯，展現多變的魔幻視覺風格。', '現貨', 0x75706c6f6164732f313736373133313333385f32392e706e67, 0),
(30, '發光弄臣', '落日飛車', 'CD', 480.00, 8, '專輯', '發光弄臣, 落日飛車, CD, 專輯, 獨立樂團, 台灣', '落日飛車經典浪漫之作，營造迷幻慵懶的城市氛圍。', '現貨', 0x75706c6f6164732f313736373133313335305f33302e706e67, 0),
(31, 'The Dark Side of the Moon', 'Pink Floyd', '50th Anniv. Vinyl', 1880.00, 5, '黑膠唱片', 'The Dark Side of the Moon, Pink Floyd, 50th Anniv. Vinyl, 黑膠唱片, 搖滾, 經典', '平克佛洛伊德史上最偉大專輯五十週年紀念版黑膠。', '現貨', 0x75706c6f6164732f313736373133313632395f33312e706e67, 0),
(32, 'Discovery', 'Daft Punk', '黑膠唱片', 1580.00, 3, '黑膠唱片', 'Discovery, Daft Punk, 黑膠唱片, 電子音樂, 法國', '電音天團經典神作，收錄《One More Time》，限量雙黑膠。', '缺貨', 0x75706c6f6164732f313736373133313836385f33322e706e67, 1),
(33, '愛情萬歲', '五月天', '12吋限量彩膠', 1680.00, 6, '黑膠唱片', '愛情萬歲, 五月天, 12吋限量彩膠, 黑膠唱片, 華語搖滾, 經典', '五月天第二張專輯限量復刻彩膠，收藏青春回憶的起點。', '現貨', 0x75706c6f6164732f313736373133313731395f33332e706e67, 0),
(34, 'Plastic Love (12\" Single)', '竹內瑪莉亞', '黑膠唱片', 980.00, 12, '黑膠唱片', 'Plastic Love (12\" Single), 竹內瑪莉亞, 黑膠唱片, Plastic Love, City Pop, 日本', 'City Pop 傳世神曲，所有黑膠愛好者必備的經典單曲盤。', '現貨', 0x75706c6f6164732f313736373133313838395f33342e706e67, 0),
(35, 'Harry\'s House', 'Harry Styles', 'Sea Glass Green Vinyl', 1450.00, 7, '黑膠唱片', 'Harry\'s House, Harry Styles, Sea Glass Green Vinyl, 黑膠唱片, 流行, 歐美', '一舉奪下葛萊美年度專輯，清新配色限量膠。', '現貨', 0x75706c6f6164732f313736373133313930355f33352e706e67, 0),
(36, 'Lover', 'Taylor Swift', 'Pink & Blue 2LP', 1580.00, 4, '黑膠唱片', 'Lover, Taylor Swift, Pink & Blue 2LP, 黑膠唱片, 流行, 彩膠', '泰勒絲最浪漫的專輯，粉藍雙色黑膠極具視覺張力。', '現貨', 0x75706c6f6164732f313736373133313931365f33362e706e67, 0),
(37, 'ROCKSTAR (Cassette)', 'LISA', '錄音帶', 480.00, 20, '錄音帶', 'ROCKSTAR (Cassette), LISA, 錄音帶, ROCKSTAR, K-POP, 個人單曲', 'LISA 自立門戶後首支強力單曲，限量卡帶極具紀念意義。', '現貨', 0x75706c6f6164732f313736373133313932395f33372e706e67, 1),
(38, 'Future Nostalgia', 'Dua Lipa', 'Blue Cassette', 380.00, 15, '錄音帶', 'Future Nostalgia, Dua Lipa, Blue Cassette, 錄音帶, 歐美流行, 復古', '杜娃黎波復古舞曲巔峰之作，藍色透殼卡帶設計。', '現貨', 0x75706c6f6164732f313736373133313934355f33382e706e67, 0),
(39, '純愛精選', '周慧敏', '復刻卡帶', 350.00, 8, '錄音帶', '純愛精選, 周慧敏, 復刻卡帶, 錄音帶, 華語流行, 經典', '90年代玉女掌門人經典復刻，重回卡帶最輝煌的年代。', '現貨', 0x75706c6f6164732f313736373133313935385f33392e706e67, 0),
(40, 'After Hours', 'The Weeknd', 'Red Cassette', 450.00, 10, '錄音帶', 'After Hours, The Weeknd, Red Cassette, 錄音帶, 靈魂樂, 加拿大', '威肯迷幻之作，紅色透明殼卡帶呼應專輯強烈視覺。', '現貨', 0x75706c6f6164732f313736373133313936395f34302e706e67, 0),
(41, 'Currents', 'Tame Impala', 'Purple Cassette', 420.00, 5, '錄音帶', 'Currents, Tame Impala, Purple Cassette, 錄音帶, 迷幻搖滾, 獨立', '迷幻搖滾新經典，卡帶音質更增添迷幻朦朧感。', '現貨', 0x75706c6f6164732f313736373132393432355f34312e706e67, 0),
(42, '莫札特：鋼琴奏鳴曲全集', 'Mozart', '五線譜', 720.00, 15, '樂譜', '莫札特：鋼琴奏鳴曲全集, Mozart, 五線譜, 樂譜, 古典, 教材', '古典樂必備教材，權威版本精確修訂。', '現貨', 0x75706c6f6164732f313736373132393332345f34322e706e67, 0),
(43, 'YOASOBI 鋼琴精選譜 (第一輯)', 'YOASOBI', '彈唱譜', 650.00, 12, '樂譜', 'YOASOBI 鋼琴精選譜 (第一輯), YOASOBI, 彈唱譜, 樂譜, YOASOBI 鋼琴精選譜, J-POP, 動漫歌曲', '內含《向夜晚奔去》、《群青》等多首熱門曲目鋼琴編曲。', '現貨', 0x75706c6f6164732f313736373132393331325f34332e706e67, 0),
(44, '超級瑪利歐系列 鋼琴譜', '任天堂', '彩色譜', 580.00, 20, '樂譜', '超級瑪利歐系列 鋼琴譜, 任天堂, 彩色譜, 樂譜, 超級瑪利歐, 遊戲音樂, 經典', '經典遊戲音樂合集，包含各代瑪利歐主題曲。', '現貨', 0x75706c6f6164732f313736373132393239375f34342e706e67, 0),
(45, '紅髮艾德：÷ (Divide) 吉他譜', 'Ed Sheeran', '吉他譜', 450.00, 10, '樂譜', '紅髮艾德：÷ (Divide) 吉他譜, Ed Sheeran, 吉他譜, 樂譜, Divide, 彈唱, 歐美流行', '收錄《Shape of You》、《Perfect》等金曲吉他樂譜。', '現貨', 0x75706c6f6164732f313736373132393135355f34352e706e67, 0),
(46, 'BTS 官方應援棒 SE', 'BTS', '應援手燈', 1650.00, 50, '周邊', 'BTS 官方應援棒 SE, BTS, 應援手燈, 周邊, BTS Lightstick, 阿米, 防彈少年團', 'BTS 官方手燈 Special Edition，具備無線連動控燈功能。', '現貨', 0x75706c6f6164732f313736373132393238345f34362e706e67, 1),
(47, '吉卜力工作室：龍貓公車站模型', '吉卜力', '收藏模型', 2200.00, 5, '周邊', '吉卜力工作室：龍貓公車站模型, 吉卜力, 收藏模型, 周邊, 龍貓, 動畫, 宮崎駿', '精緻手工塗裝模型，還原電影中經典雨中等車場景。', '現貨', 0x75706c6f6164732f313736373132393236385f34372e706e67, 0),
(48, '藤井 風 HELP EVER ARENA TOUR 毛巾', '藤井 風', '周邊', 750.00, 15, '周邊', '藤井 風 HELP EVER ARENA TOUR 毛巾, 藤井 風, 周邊, Arena Tour 毛巾, 日本藝人, 演唱會商品', '2021 巡迴演唱會官方周邊，吸水性佳且極具收藏價值。', '現貨', 0x75706c6f6164732f313736373132393133385f34382e706e67, 0),
(49, 'Audio-Technica AT-LP60XBT', '鐵三角', '藍牙黑膠唱盤', 6580.00, 5, '其他', 'Audio-Technica AT-LP60XBT, 鐵三角, 藍牙黑膠唱盤, 其他, AT-LP60XBT, 黑膠機, 音響', '入門首選全自動黑膠唱盤，支援藍牙連線，無線聆聽更方便。', '現貨', 0x75706c6f6164732f313736373132383536315f34392e706e67, 0),
(50, '黑膠唱片深度清潔組', 'AM Denmark', '清潔工具', 880.00, 20, '其他', '黑膠唱片深度清潔組, AM Denmark, 清潔工具, 其他, 清潔組, 黑膠配件, 保養', '含防靜電刷與清潔液，有效提升黑膠播放音質並延長壽命。', '現貨', 0x75706c6f6164732f313736373132383432355f35302e706e67, 0);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`cart_detail_id`),
  ADD KEY `cart_id` (`cart_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- 資料表索引 `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `cart_detail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `cart_detail_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
